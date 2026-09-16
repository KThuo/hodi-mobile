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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _shake,
          builder: (context, child) {
            // Three there-and-back cycles, decaying — a nudge, not a wobble.
            final t = _shake.value;
            final offset = t == 0 ? 0.0 : (1 - t) * 10 * _sin3(t);
            return Transform.translate(offset: Offset(offset, 0), child: child);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.length, (i) {
              final filled = i < _entered.length;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                margin: const EdgeInsets.symmetric(horizontal: 9),
                width: filled ? 15 : 13,
                height: filled ? 15 : 13,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: filled ? HodiColors.primaryStart : Colors.transparent,
                  border: Border.all(
                    color: widget.error != null
                        ? HodiColors.errorStart
                        : (filled ? HodiColors.primaryStart : HodiColors.dividerStrong),
                    width: 1.6,
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 20,
          child: widget.error == null
              ? null
              : Text(
                  widget.error!,
                  textAlign: TextAlign.center,
                  style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.errorEnd),
                ),
        ),
        const SizedBox(height: 10),
        for (final row in const [
          ['1', '2', '3'],
          ['4', '5', '6'],
          ['7', '8', '9'],
        ])
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [for (final d in row) _Key(label: d, onTap: () => _tap(d))],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // An empty cell rather than a missing one, so 0 sits under 8 as it does on a telephone.
            const _Key.blank(),
            _Key(label: '0', onTap: () => _tap('0')),
            _Key(icon: Icons.backspace_outlined, onTap: _back),
          ],
        ),
        if (widget.onForgot != null) ...[
          const SizedBox(height: 6),
          TextButton(
            onPressed: widget.busy ? null : widget.onForgot,
            child: Text(
              widget.forgotLabel,
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.primaryStart,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }

  /// Three oscillations across the animation, without pulling in dart:math for one sine.
  static double _sin3(double t) {
    final x = t * 3 * 2 * 3.1415926535;
    // Bhaskara's approximation, good to a fraction of a percent and plenty for a shake.
    final wrapped = x % (2 * 3.1415926535);
    final s = wrapped <= 3.1415926535 ? wrapped : wrapped - 2 * 3.1415926535;
    final abs = s.abs();
    final v = (16 * abs * (3.1415926535 - abs)) /
        (5 * 3.1415926535 * 3.1415926535 - 4 * abs * (3.1415926535 - abs));
    return s < 0 ? -v : v;
  }
}

class _Key extends StatelessWidget {
  const _Key({this.label, this.icon, this.onTap});
  const _Key.blank()
      : label = null,
        icon = null,
        onTap = null;

  final String? label;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // 76 across with margin: comfortably past the 48dp touch target, and three of them fit the
    // narrowest phone still in use.
    if (label == null && icon == null) return const SizedBox(width: 76, height: 66);

    return SizedBox(
      width: 76,
      height: 66,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(33),
        child: Center(
          child: icon != null
              ? Icon(icon, size: 24, color: HodiColors.textMedium)
              : Text(
                  label!,
                  style: HodiTextStyles.heading2.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: HodiColors.textDark,
                  ),
                ),
        ),
      ),
    );
  }
}
