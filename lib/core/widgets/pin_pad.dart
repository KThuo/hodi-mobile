import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/hodi_colors.dart';
import '../theme/hodi_text_styles.dart';

/// A keypad, and the dots above it saying how far somebody has got.
///
/// ## Why a keypad rather than a text field
///
/// A digits-only `TextField` puts the phone's own keyboard up, which on most handsets is the full
/// alphabetic one with a number row — small targets, and a layout that moves. A PIN is entered one
/// handed, often walking, and the targets should be large and in the same place every time.
///
/// It also keeps the digits out of the places a keyboard puts them: no autofill, no predictive
/// text, no clipboard history.
///
/// ## Give it a key when the same screen asks twice
///
/// The pad holds what has been typed in its own `State`, so two steps rendering a pad at the same
/// position in the tree share it — Flutter reuses the element, and the second step opens with the
/// first step's four digits still in it. That is what made "choose, then confirm" need four
/// backspaces before it would accept anything.
///
/// So: **pass a [Key] that changes when the question changes** — `key: ValueKey(step)`. There is
/// no `clear()` to call and deliberately no controller; the pad owning its digits is what keeps
/// them out of the caller's state, and a key is how Flutter is told this is a different question.
///
/// ## What it does not do
///
/// It does not know whether the PIN is right — it collects [length] digits and hands them over.
/// Whoever is asking decides what that means, which is what keeps the "wrong PIN" wording and the
/// counting of attempts in one place instead of two.
class PinPad extends StatefulWidget {
  const PinPad({
    super.key,
    required this.onCompleted,
    this.length = 4,
    this.busy = false,
    this.error,
    this.onForgot,
    this.forgotLabel = 'Use my password instead',
  });

  /// Called with the digits once [length] of them have been tapped.
  final ValueChanged<String> onCompleted;

  final int length;

  /// Locks the pad while the answer is in flight, so a double tap is not two attempts.
  final bool busy;

  /// Shown under the dots. Setting it also shakes them — a message alone is easy to miss on a
  /// screen somebody is looking away from.
  final String? error;

  final VoidCallback? onForgot;
  final String forgotLabel;

  @override
  State<PinPad> createState() => _PinPadState();
}

class _PinPadState extends State<PinPad> with SingleTickerProviderStateMixin {
  String _entered = '';
  late final AnimationController _shake = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 380),
  );

  @override
  void initState() {
    super.initState();
    // A pad built with an error already on it is a pad the caller keyed afresh after a refusal —
    // the shake belongs to the message, not to the widget having been rebuilt.
    if (widget.error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _shake.forward(from: 0);
      });
    }
  }

  @override
  void didUpdateWidget(PinPad old) {
    super.didUpdateWidget(old);
    // A new error means a new refusal: clear what was typed and say so, rather than leaving four
    // dots filled under a message about them being wrong.
    if (widget.error != null && widget.error != old.error) {
      setState(() => _entered = '');
      _shake.forward(from: 0);
      HapticFeedback.mediumImpact();
    }
  }

  @override
  void dispose() {
    _shake.dispose();
    super.dispose();
  }

  void _tap(String digit) {
    if (widget.busy || _entered.length >= widget.length) return;
    HapticFeedback.selectionClick();
    setState(() => _entered += digit);
    if (_entered.length == widget.length) {
      widget.onCompleted(_entered);
    }
  }

  void _back() {
    if (widget.busy || _entered.isEmpty) return;
    HapticFeedback.selectionClick();
    setState(() => _entered = _entered.substring(0, _entered.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    final failed = widget.error != null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── The dots ──────────────────────────────────────────────────────
        AnimatedBuilder(
          animation: _shake,
          builder: (context, child) {
            // Three there-and-back cycles, decaying — a nudge, not a wobble.
            final t = _shake.value;
            final offset = t == 0 ? 0.0 : (1 - t) * 10 * math.sin(t * 3 * 2 * math.pi);
            return Transform.translate(offset: Offset(offset, 0), child: child);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.length, (i) {
              final filled = i < _entered.length;
              final colour = failed
                  ? HodiColors.errorStart
                  : (filled ? HodiColors.primaryStart : HodiColors.dividerStrong);
              return AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                curve: Curves.easeOutBack,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: filled ? colour : Colors.transparent,
                  border: Border.all(color: colour, width: 1.8),
                  // A filled dot lifts very slightly off the page, so progress is legible at a
                  // glance without the dots having to grow and shuffle the row sideways.
                  boxShadow: filled && !failed
                      ? [
                          BoxShadow(
                            color: colour.withValues(alpha: 0.35),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
              );
            }),
          ),
        ),

        // Reserved whether or not there is a message, so the keypad does not jump up the screen
        // when one appears — the keys must not move under a thumb that is already travelling.
        SizedBox(
          height: 38,
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: failed ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.error ?? '',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: HodiTextStyles.bodySmall.copyWith(
                    color: HodiColors.errorEnd,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),

        // ── The keys ──────────────────────────────────────────────────────
        //
        // Dimmed rather than removed while a request is in flight: a pad that vanishes and comes
        // back has moved, and somebody mid-tap lands on whatever took its place.
        AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: widget.busy ? 0.45 : 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final row in const [
                ['1', '2', '3'],
                ['4', '5', '6'],
                ['7', '8', '9'],
              ])
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (final d in row) _Key(label: d, onTap: () => _tap(d)),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // An empty cell rather than a missing one, so 0 sits under 8 as it does on a
                  // telephone.
                  const _Key.blank(),
                  _Key(label: '0', onTap: () => _tap('0')),
                  _Key(
                    icon: Icons.backspace_outlined,
                    onTap: _back,
                    // No fill on backspace. It is the one key that undoes rather than enters, and
                    // a plain glyph is how every handset's own pad distinguishes it.
                    plain: true,
                    enabled: _entered.isNotEmpty,
                  ),
                ],
              ),
            ],
          ),
        ),

        if (widget.onForgot != null) ...[
          const SizedBox(height: 10),
          TextButton(
            onPressed: widget.busy ? null : widget.onForgot,
            style: TextButton.styleFrom(
              foregroundColor: HodiColors.primaryStart,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: Text(
              widget.forgotLabel,
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.primaryStart,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// One key: a circle with a quiet fill, brand-tinted while pressed.
class _Key extends StatefulWidget {
  const _Key({
    this.label,
    this.icon,
    this.onTap,
    this.plain = false,
    this.enabled = true,
  });

  const _Key.blank()
      : label = null,
        icon = null,
        onTap = null,
        plain = true,
        enabled = false;

  final String? label;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool plain;
  final bool enabled;

  @override
  State<_Key> createState() => _KeyState();
}

class _KeyState extends State<_Key> {
  bool _down = false;

  /// 64 across inside a 78 cell: comfortably past the 48dp target, with the gap between circles
  /// doing the work the old flat keys asked the eye to do.
  static const _cell = 78.0;
  static const _circle = 64.0;

  @override
  Widget build(BuildContext context) {
    if (widget.label == null && widget.icon == null) {
      return const SizedBox(width: _cell, height: _cell);
    }

    final interactive = widget.enabled && widget.onTap != null;

    return SizedBox(
      width: _cell,
      height: _cell,
      child: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: interactive ? (_) => setState(() => _down = true) : null,
          onTapUp: interactive ? (_) => setState(() => _down = false) : null,
          onTapCancel: interactive ? () => setState(() => _down = false) : null,
          onTap: interactive ? widget.onTap : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 90),
            width: _circle,
            height: _circle,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _down
                  ? HodiColors.brandSoft
                  : widget.plain
                      ? Colors.transparent
                      : HodiColors.surfaceInset,
            ),
            child: Center(
              child: widget.icon != null
                  ? Icon(
                      widget.icon,
                      size: 24,
                      color: interactive
                          ? (_down ? HodiColors.primaryStart : HodiColors.textMedium)
                          : HodiColors.textFaint,
                    )
                  : Text(
                      widget.label!,
                      style: HodiTextStyles.heading2.copyWith(
                        fontSize: 27,
                        fontWeight: FontWeight.w500,
                        color: _down ? HodiColors.primaryStart : HodiColors.textDark,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
