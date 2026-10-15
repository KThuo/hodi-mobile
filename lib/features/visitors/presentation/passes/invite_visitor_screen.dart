import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_app_bar.dart';
import '../../../../core/widgets/hodi_gradient_button.dart';
import '../../../../core/widgets/hodi_text_field.dart';
import '../../providers/visit_providers.dart';
import 'pass_widgets.dart';

/// The host invites somebody ahead of time.
///
/// What the gate would ask, without the identity document: a name, a phone to send the pass to,
/// the car if they are driving, how many are coming and when. The pass that comes back is what
/// the visitor shows at the gate.
class InviteVisitorScreen extends ConsumerStatefulWidget {
  const InviteVisitorScreen({super.key});

  @override
  ConsumerState<InviteVisitorScreen> createState() => _InviteVisitorScreenState();
}

class _InviteVisitorScreenState extends ConsumerState<InviteVisitorScreen> {
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _vehicle = TextEditingController();
  final _notes = TextEditingController();

  int _count = 1;
  late DateTime _from;
  DateTime? _until;
  String _purpose = 'SOCIAL';
  String? _houseId;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _from = DateTime(now.year, now.month, now.day);
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _vehicle.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _pickFrom() async {
    final today = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _from,
      firstDate: DateTime(today.year, today.month, today.day),
      lastDate: today.add(const Duration(days: 90)),
    );
    if (picked == null) return;
    setState(() {
      _from = picked;
      if (_until != null && (_until!.isBefore(picked) || _until!.difference(picked).inDays > 30)) {
        _until = null;
      }
    });
  }

  Future<void> _pickUntil() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _until ?? _from.add(const Duration(days: 1)),
      firstDate: _from,
      lastDate: _from.add(const Duration(days: 30)),
    );
    if (picked != null) setState(() => _until = picked);
  }

  Future<void> _submit() async {
    if (_name.text.trim().isEmpty) {
      _say('Who are you expecting?');
      return;
    }
    setState(() => _busy = true);
    final response = await ref.read(visitRepositoryProvider).invite(
          visitorName: _name.text,
          visitorPhone: _phone.text,
          vehicleReg: _vehicle.text,
          visitorCount: _count,
          validFrom: _from,
          validUntil: _until ?? _from,
          purpose: _purpose,
          purposeNotes: _notes.text,
          houseId: _houseId,
        );
    if (!mounted) return;
    setState(() => _busy = false);
    if (!response.isSuccess || response.data == null) {
      _say(response.message.isNotEmpty ? response.message : 'The pass could not be made. Try again.');
      return;
    }
    ref.invalidate(myPassesProvider);
    // Straight to the pass, which is where it is sent from. Replacing the form, so Back does not
    // reopen a form that has already been sent.
    context.pushReplacement('/more/visitors/pass', extra: response.data);
  }

  void _say(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: HodiColors.errorStart,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final units = ref.watch(myUnitsProvider).value ?? const [];
    final day = DateFormat('EEE d MMM');

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Invite a visitor'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          children: [
            Text(
              'You get a pass to send them. They show it at the gate and are let in without '
              'anybody calling you.',
              style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textMedium),
            ),
            const SizedBox(height: 20),
            if (units.length > 1) ...[
              const _Label('Which unit?'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                initialValue: _houseId,
                isExpanded: true,
                hint: const Text('Choose your unit'),
                items: [
                  for (final u in units)
                    DropdownMenuItem(value: u.houseId, child: Text(u.label, overflow: TextOverflow.ellipsis)),
                ],
                onChanged: (v) => setState(() => _houseId = v),
              ),
              const SizedBox(height: 16),
            ],
            const _Label('Their name'),
            const SizedBox(height: 8),
            HodiTextField(controller: _name, hintText: 'Full name'),
            const SizedBox(height: 16),
            const _Label('Their phone number'),
            const SizedBox(height: 8),
            HodiTextField(
              controller: _phone,
              hintText: '07…',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            const _Label('Vehicle registration (if they are driving)'),
            const SizedBox(height: 8),
            HodiTextField(controller: _vehicle, hintText: 'e.g. KDA 123A'),
            const SizedBox(height: 16),
            const _Label('How many people are coming?'),
            const SizedBox(height: 8),
            Row(
              children: [
                _Round(icon: Icons.remove, onTap: _count > 1 ? () => setState(() => _count--) : null),
                Expanded(
                  child: Text('$_count', textAlign: TextAlign.center, style: HodiTextStyles.heading2),
                ),
                _Round(icon: Icons.add, onTap: _count < 200 ? () => setState(() => _count++) : null),
              ],
            ),
            const SizedBox(height: 16),
            const _Label('When?'),
            const SizedBox(height: 8),
            _DateTile(
              icon: Icons.event,
              label: _until == null ? 'On' : 'From',
              value: day.format(_from),
              onTap: _pickFrom,
            ),
            const SizedBox(height: 8),
            _until == null
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: _pickUntil,
                      icon: const Icon(Icons.date_range, size: 18),
                      label: const Text('Staying more than a day?'),
                    ),
                  )
                : _DateTile(
                    icon: Icons.event_available,
                    label: 'Until',
                    value: day.format(_until!),
                    onTap: _pickUntil,
                    onClear: () => setState(() => _until = null),
                  ),
            const SizedBox(height: 16),
            const _Label('Why are they coming?'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final code in const ['SOCIAL', 'DELIVERY', 'SERVICE', 'OTHER'])
                  ChoiceChip(
                    label: Text(purposeLabel(code)),
                    selected: _purpose == code,
                    onSelected: (_) => setState(() => _purpose = code),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            const _Label('A note for the gate (optional)'),
            const SizedBox(height: 8),
            HodiTextField(controller: _notes, hintText: 'e.g. bringing a delivery to the back', maxLines: 2),
            const SizedBox(height: 28),
            HodiGradientButton(
              text: 'Create pass',
              icon: Icons.qr_code_2,
              isLoading: _busy,
              onPressed: _busy ? null : _submit,
            ),
          ],
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: HodiTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
      );
}

class _Round extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const _Round({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: onTap == null ? HodiColors.surfaceInset : HodiColors.brandSoft,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: onTap == null ? HodiColors.textFaint : HodiColors.primaryStart),
        ),
      ),
    );
  }
}

class _DateTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  const _DateTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: HodiColors.cardBackground,
      borderRadius: HodiBorderRadius.card,
      child: InkWell(
        borderRadius: HodiBorderRadius.card,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Icon(icon, color: HodiColors.primaryStart),
              const SizedBox(width: 12),
              Text(label, style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textLight)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(value, style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
              ),
              if (onClear != null)
                IconButton(
                  tooltip: 'Just the one day',
                  icon: const Icon(Icons.close, size: 18),
                  onPressed: onClear,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
