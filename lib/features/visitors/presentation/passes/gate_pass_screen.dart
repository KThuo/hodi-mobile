import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_app_bar.dart';
import '../../../../core/widgets/hodi_gradient_button.dart';
import '../../../../core/widgets/hodi_text_field.dart';
import '../../domain/pass_model.dart';
import '../../domain/visit_model.dart';
import '../../providers/visit_providers.dart';
import 'pass_widgets.dart';

/// A pass, as the gate reads it: whether it is good, who, and where they are going.
///
/// One button, and it is only live when the pass is good today. Letting them in records the visit
/// as approved by the host — they invited them — so nobody is phoned. The ID number is the
/// estate's call: offered, never required.
class GatePassScreen extends ConsumerStatefulWidget {
  final PassModel pass;

  const GatePassScreen({super.key, required this.pass});

  @override
  ConsumerState<GatePassScreen> createState() => _GatePassScreenState();
}

class _GatePassScreenState extends ConsumerState<GatePassScreen> {
  late PassModel _pass = widget.pass;
  final _idNumber = TextEditingController();
  bool _takeId = false;
  bool _busy = false;

  @override
  void dispose() {
    _idNumber.dispose();
    super.dispose();
  }

  Future<void> _admit() async {
    setState(() => _busy = true);
    final response = await ref.read(visitRepositoryProvider).admit(
          _pass.id,
          idNumber: _takeId ? _idNumber.text : null,
        );
    if (!mounted) return;
    setState(() => _busy = false);

    final result = response.data;
    if (!response.isSuccess || result == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.message.isNotEmpty ? response.message : 'That did not go through.'),
        backgroundColor: HodiColors.errorStart,
      ));
      // Somebody else may have admitted them a moment ago; show the pass as it is now.
      final fresh = await ref.read(visitRepositoryProvider).passByCode(_pass.passCode);
      if (mounted && fresh.isSuccess && fresh.data != null) setState(() => _pass = fresh.data!);
      return;
    }

    await _showOutcome(result);
    if (!mounted) return;
    ref.read(visitListProvider.notifier).refresh();
    context.go('/more/visitors');
  }

  Future<void> _showOutcome(CheckInResultModel result) {
    final (icon, colour, heading) = result.barred
        ? (Icons.block, HodiColors.errorStart, 'Do not let them in')
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
            Text(heading,
                style: HodiTextStyles.heading2.copyWith(color: colour), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(result.barReason ?? result.message,
                style: HodiTextStyles.bodyMedium, textAlign: TextAlign.center),
          ],
        ),
        actions: [
          Center(
            child: TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Done')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = _pass;
    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Visitor pass'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          children: [
            PassStateBanner(pass: p, large: true),
            const SizedBox(height: 18),
            Text(p.visitorName, style: HodiTextStyles.heading2),
            const SizedBox(height: 4),
            Text(p.passCode, style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight, letterSpacing: 2)),
            const SizedBox(height: 12),
            PassFact(
              icon: Icons.home_outlined,
              label: 'Visiting',
              value: p.where.isEmpty ? '—' : p.where,
            ),
            if (p.tenantName != null && p.tenantName!.isNotEmpty)
              PassFact(icon: Icons.person_pin_outlined, label: 'Invited by', value: p.tenantName!),
            PassFact(
              icon: Icons.groups_outlined,
              label: 'People',
              value: p.visitorCount == 1 ? 'One person' : '${p.visitorCount} people',
            ),
            if (p.vehicleReg != null && p.vehicleReg!.isNotEmpty)
              PassFact(icon: Icons.directions_car_outlined, label: 'Vehicle', value: p.vehicleReg!),
            if (p.visitorPhone != null && p.visitorPhone!.isNotEmpty)
              PassFact(icon: Icons.phone_outlined, label: 'Phone', value: p.visitorPhone!),
            PassFact(icon: Icons.event, label: 'Expected', value: passDays(p)),
            PassFact(
              icon: Icons.info_outline,
              label: 'Reason',
              value: [
                purposeLabel(p.purpose),
                if (p.purposeNotes != null && p.purposeNotes!.isNotEmpty) p.purposeNotes!,
              ].join(' — '),
            ),
            const SizedBox(height: 16),
            if (p.admissible) ...[
              if (!_takeId)
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () => setState(() => _takeId = true),
                    icon: const Icon(Icons.badge_outlined, size: 18),
                    label: const Text('Record their ID number'),
                  ),
                )
              else ...[
                Text('ID number (optional)',
                    style: HodiTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                HodiTextField(controller: _idNumber, hintText: 'National ID', keyboardType: TextInputType.number),
              ],
              const SizedBox(height: 20),
              HodiGradientButton(
                text: 'Let them in',
                icon: Icons.login,
                isLoading: _busy,
                onPressed: _busy ? null : _admit,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
