import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../houses/providers/house_providers.dart';
import '../domain/visit_model.dart';
import '../providers/visit_providers.dart';

/// Bringing somebody in at the gate.
///
/// ## Built for the person holding the phone, not for the form
///
/// This is used standing at a barrier, often at night, by somebody who does not spend their day
/// with computers and has a visitor waiting in front of them. Every decision here follows from
/// that:
///
/// - **One question per screen.** Four short steps instead of a page of fields, so nothing is
///   scrolled past and nothing is half-filled.
/// - **The phone number first, and it does the typing.** `GET /visits/known` answers with the
///   name, the identification and the vehicle for anybody seen before — so a regular is two taps,
///   not a form. The server's own note says why: asking again is how one visitor becomes three
///   spellings.
/// - **Why they are here is six big buttons**, not a dropdown. A dropdown on a phone is a tap, a
///   scroll, a read and a tap.
/// - **Only the name is required.** Everything else the server allows to be absent is optional
///   here too, because a gate that cannot admit somebody without their ID number is a gate that
///   gets bypassed on paper.
/// - **The keypad is the number pad** wherever the answer is digits.
class CheckInScreen extends ConsumerStatefulWidget {
  const CheckInScreen({super.key});

  @override
  ConsumerState<CheckInScreen> createState() => _CheckInScreenState();
}

enum _Step { phone, who, why, where }

class _CheckInScreenState extends ConsumerState<CheckInScreen> {
  final _phone = TextEditingController();
  final _name = TextEditingController();
  final _idNumber = TextEditingController();
  final _vehicle = TextEditingController();
  final _notes = TextEditingController();

  _Step _step = _Step.phone;
  String _purpose = '';
  String? _houseId;
  int _count = 1;
  bool _busy = false;
  KnownVisitorModel? _known;

  @override
  void dispose() {
    _phone.dispose();
    _name.dispose();
    _idNumber.dispose();
    _vehicle.dispose();
    _notes.dispose();
    super.dispose();
  }

  /// Looks the number up and fills in what is already known.
  ///
  /// Failure is silent on purpose: a lookup that cannot answer must not stop somebody being let
  /// in. It simply means the next screen starts empty, which is where it would have started.
  Future<void> _lookUp() async {
    final phone = _phone.text.trim();
    if (phone.isEmpty) {
      setState(() => _step = _Step.who);
      return;
    }

    setState(() => _busy = true);
    final response = await ref.read(visitRepositoryProvider).known(phone);
    if (!mounted) return;

    final found = response.isSuccess ? response.data : null;
    setState(() {
      _busy = false;
      _known = found;
      if (found != null) {
        _name.text = found.visitorName;
        _idNumber.text = found.idNumber ?? '';
        _vehicle.text = found.vehicleReg ?? '';
      }
      _step = _Step.who;
    });
  }

  Future<void> _submit() async {
    setState(() => _busy = true);

    final response = await ref.read(visitRepositoryProvider).checkIn(
          visitorName: _name.text.trim(),
          purpose: _purpose,
          houseId: _houseId,
          visitorPhone: _phone.text.trim(),
          idType: _idNumber.text.trim().isEmpty ? null : 'NATIONAL_ID',
          idNumber: _idNumber.text.trim(),
          visitorCount: _count,
          vehicleReg: _vehicle.text,
          purposeNotes: _notes.text,
        );

    if (!mounted) return;
    setState(() => _busy = false);

    final result = response.data;
    if (!response.isSuccess && result == null) {
      _say(response.message.isNotEmpty
          ? response.message
          : 'That did not go through. Try again.');
      return;
    }

    // Three outcomes, and the gate needs to tell them apart at a glance: let them in, wait for
    // the host, or turn them away. A snackbar is not enough for the third.
    await _showOutcome(result!);
    if (!mounted) return;
    ref.read(visitListProvider.notifier).refresh();
    Navigator.of(context).pop(true);
  }

  void _say(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: HodiColors.errorStart,
    ));
  }

  Future<void> _showOutcome(CheckInResultModel result) {
    final (icon, colour, heading) = result.barred
        ? (Icons.block, HodiColors.errorStart, 'Do not let them in')
        : result.awaitingHost
            ? (Icons.hourglass_top, HodiColors.warningEnd, 'Wait for the host')
            : (Icons.check_circle, HodiColors.successEnd, 'Let them in');

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: HodiBorderRadius.card),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: colour),
            const SizedBox(height: 14),
            Text(
              heading,
              style: HodiTextStyles.heading2.copyWith(color: colour),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              result.barReason ?? result.message,
              style: HodiTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: HodiAppBar(title: _title),
      body: SafeArea(
        child: Column(
          children: [
            _Progress(step: _step),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
                child: switch (_step) {
                  _Step.phone => _phoneStep(),
                  _Step.who => _whoStep(),
                  _Step.why => _whyStep(),
                  _Step.where => _whereStep(),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _title => switch (_step) {
        _Step.phone => 'Their number',
        _Step.who => 'Who is it?',
        _Step.why => 'Why are they here?',
        _Step.where => 'Who are they seeing?',
      };

  // ── 1. The number ───────────────────────────────────────────────────────

  Widget _phoneStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _Prompt(
          text: 'Type their phone number.',
          hint: 'If they have been here before, everything else fills itself in.',
        ),
        const SizedBox(height: 20),
        _BigField(
          controller: _phone,
          hint: '07…',
          keyboardType: TextInputType.phone,
          autofocus: true,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 24),
        _Next(label: 'Next', busy: _busy, onTap: _lookUp),
        const SizedBox(height: 12),
        // Somebody with no phone still has to get in. A gate that cannot record that is a gate
        // that keeps a paper book beside it.
        TextButton(
          onPressed: _busy ? null : () => setState(() => _step = _Step.who),
          child: Text(
            'They have no number',
            style: HodiTextStyles.bodyMedium
                .copyWith(color: HodiColors.textMedium),
          ),
        ),
      ],
    );
  }

  // ── 2. Who ──────────────────────────────────────────────────────────────

  Widget _whoStep() {
    final known = _known;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (known != null) ...[
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: HodiColors.successBg,
              borderRadius: HodiBorderRadius.card,
            ),
            child: Row(
              children: [
                const Icon(Icons.how_to_reg,
                    size: 22, color: HodiColors.successEnd),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    known.visits > 1
                        ? 'Been here ${known.visits} times before.'
                        : 'Been here before.',
                    style: HodiTextStyles.bodyMedium.copyWith(
                      color: HodiColors.successEnd,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
        ] else
          const _Prompt(text: 'What is their name?'),
        const SizedBox(height: 12),
        _BigField(
          controller: _name,
          hint: 'Full name',
          autofocus: known == null,
          textCapitalization: TextCapitalization.words,
          onChanged: (_) => setState(() {}),
        ),
        const SizedBox(height: 18),

        const _Label('How many people?'),
        const SizedBox(height: 8),
        Row(
          children: [
            _Round(
              icon: Icons.remove,
              onTap: _count > 1 ? () => setState(() => _count--) : null,
            ),
            Expanded(
              child: Text(
                '$_count',
                textAlign: TextAlign.center,
                style: HodiTextStyles.heading2,
              ),
            ),
            _Round(icon: Icons.add, onTap: () => setState(() => _count++)),
          ],
        ),
        const SizedBox(height: 18),

        const _Label('ID number (if they have one)'),
        const SizedBox(height: 8),
        _BigField(
          controller: _idNumber,
          hint: 'Optional',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 14),

        const _Label('Vehicle (if they drove)'),
        const SizedBox(height: 8),
        _BigField(
          controller: _vehicle,
          hint: 'Optional — KDA 123X',
          textCapitalization: TextCapitalization.characters,
        ),

        const SizedBox(height: 24),
        _Next(
          label: 'Next',
          // The only thing the server insists on, so the only thing this waits for.
          onTap: _name.text.trim().isEmpty
              ? null
              : () => setState(() => _step = _Step.why),
        ),
        _Back(onTap: () => setState(() => _step = _Step.phone)),
      ],
    );
  }

  // ── 3. Why ──────────────────────────────────────────────────────────────

  Widget _whyStep() {
    const purposes = <({String code, String label, IconData icon})>[
      (code: 'SOCIAL', label: 'Visiting', icon: Icons.people_outline),
      (code: 'DELIVERY', label: 'Delivery', icon: Icons.local_shipping_outlined),
      (code: 'SERVICE', label: 'Repairs', icon: Icons.build_outlined),
      (code: 'VIEWING', label: 'Viewing', icon: Icons.home_work_outlined),
      (code: 'OFFICIAL', label: 'Official', icon: Icons.badge_outlined),
      (code: 'OTHER', label: 'Something else', icon: Icons.more_horiz),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _Prompt(text: 'Tap the reason.'),
        const SizedBox(height: 16),
        // Buttons, not a dropdown: a dropdown on a phone is a tap, a scroll, a read and a tap.
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.5,
          children: [
            for (final p in purposes)
              _PurposeTile(
                label: p.label,
                icon: p.icon,
                selected: _purpose == p.code,
                onTap: () => setState(() {
                  _purpose = p.code;
                  _step = _Step.where;
                }),
              ),
          ],
        ),
        const SizedBox(height: 18),
        _BigField(
          controller: _notes,
          hint: 'Anything to add (optional)',
          maxLines: 2,
        ),
        _Back(onTap: () => setState(() => _step = _Step.who)),
      ],
    );
  }

  // ── 4. Where ────────────────────────────────────────────────────────────

  Widget _whereStep() {
    final units = ref.watch(houseListProvider).houses;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _Prompt(
          text: 'Which house?',
          hint: 'The person living there is asked to say yes.',
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 320),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: units.length,
            itemBuilder: (context, i) {
              final unit = units[i];
              final chosen = _houseId == unit.id;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GestureDetector(
                  onTap: () => setState(() => _houseId = unit.id),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: chosen
                          ? HodiColors.primaryStart
                          : HodiColors.cardBackground,
                      borderRadius: HodiBorderRadius.card,
                      border: Border.all(
                        color:
                            chosen ? HodiColors.primaryStart : HodiColors.divider,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            unit.displayName,
                            style: HodiTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                              color: chosen
                                  ? HodiColors.white
                                  : HodiColors.textDark,
                            ),
                          ),
                        ),
                        if (chosen)
                          const Icon(Icons.check_circle,
                              color: HodiColors.white, size: 22),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 18),
        _Next(
          label: 'Let them in',
          busy: _busy,
          // A visit with no unit is still a visit — a contractor for the whole block, a delivery
          // to the office. The server allows houseId to be absent, so this does not insist.
          onTap: _busy ? null : _submit,
        ),
        _Back(onTap: () => setState(() => _step = _Step.why)),
      ],
    );
  }
}

// ── The pieces, all sized for a thumb at a barrier ─────────────────────────

class _Progress extends StatelessWidget {
  const _Progress({required this.step});

  final _Step step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          for (final s in _Step.values) ...[
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: s.index <= step.index
                      ? HodiColors.primaryStart
                      : HodiColors.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            if (s != _Step.values.last) const SizedBox(width: 6),
          ],
        ],
      ),
    );
  }
}

class _Prompt extends StatelessWidget {
  const _Prompt({required this.text, this.hint});

  final String text;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: HodiTextStyles.heading3.copyWith(fontSize: 17)),
        if (hint != null) ...[
          const SizedBox(height: 6),
          Text(hint!,
              style:
                  HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textMedium)),
        ],
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: HodiTextStyles.bodyMedium
            .copyWith(fontWeight: FontWeight.w600, color: HodiColors.textMedium),
      );
}

/// A field somebody can hit without looking.
class _BigField extends StatelessWidget {
  const _BigField({
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.autofocus = false,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final bool autofocus;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autofocus,
      maxLines: maxLines,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      inputFormatters: keyboardType == TextInputType.phone
          ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9+ ]'))]
          : null,
      style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: HodiTextStyles.bodyLarge.copyWith(color: HodiColors.textFaint),
        // Generous padding is what makes this easy to hit. Oversized type was not — it just
        // made the screen look like it came from a different application.
        filled: true,
        fillColor: HodiColors.cardBackground,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: HodiBorderRadius.card,
          borderSide: const BorderSide(color: HodiColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: HodiBorderRadius.card,
          borderSide: const BorderSide(color: HodiColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: HodiBorderRadius.card,
          borderSide: BorderSide(color: HodiColors.primaryStart, width: 2),
        ),
      ),
    );
  }
}

class _Next extends StatelessWidget {
  const _Next({required this.label, this.busy = false, this.onTap});

  final String label;
  final bool busy;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: FilledButton(
        onPressed: busy ? null : onTap,
        style: FilledButton.styleFrom(
          backgroundColor: HodiColors.primaryStart,
          shape: RoundedRectangleBorder(borderRadius: HodiBorderRadius.card),
        ),
        child: busy
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                    strokeWidth: 2.5, color: Colors.white),
              )
            : Text(
                label,
                style: HodiTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600, color: HodiColors.white),
              ),
      ),
    );
  }
}

class _Back extends StatelessWidget {
  const _Back({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton.icon(
        onPressed: onTap,
        icon: const Icon(Icons.arrow_back, size: 18),
        label: const Text('Back'),
        style: TextButton.styleFrom(foregroundColor: HodiColors.textMedium),
      ),
    );
  }
}

class _Round extends StatelessWidget {
  const _Round({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final live = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          color: live ? HodiColors.surfaceInset : HodiColors.surfaceLight,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 26,
          color: live ? HodiColors.textDark : HodiColors.textFaint,
        ),
      ),
    );
  }
}

class _PurposeTile extends StatelessWidget {
  const _PurposeTile({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? HodiColors.primaryStart : HodiColors.cardBackground,
          borderRadius: HodiBorderRadius.card,
          border: Border.all(
            color: selected ? HodiColors.primaryStart : HodiColors.divider,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: selected ? HodiColors.white : HodiColors.primaryStart,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: HodiTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: selected ? HodiColors.white : HodiColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
