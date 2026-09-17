import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_gradient_button.dart';
import '../../../../core/widgets/hodi_text_field.dart';
import '../../../occupations/providers/occupation_providers.dart';
import '../../domain/maintenance_models.dart';
import '../../providers/maintenance_providers.dart';

/// Reporting something broken.
///
/// Kept to the five fields the server requires or clearly wants, because this is filled in while
/// standing in front of the problem. Everything else on `RaiseRequest` — the preferred window, the
/// channel, whose request it is — is either the office's or answered by where the form is: the
/// channel is MOBILE and the tenant is whoever is signed in, which the server decides anyway.
class RaiseRequestSheet extends ConsumerStatefulWidget {
  const RaiseRequestSheet({super.key});

  @override
  ConsumerState<RaiseRequestSheet> createState() => _RaiseRequestSheetState();
}

class _RaiseRequestSheetState extends ConsumerState<RaiseRequestSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _accessController = TextEditingController();

  MaintenanceCategoryModel? _category;
  String _priority = 'NORMAL';
  String? _houseId;
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _accessController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_category == null) {
      setState(() => _error = 'Choose what this is about.');
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
    });

    final response = await ref.read(maintenanceRepositoryProvider).raise(
          categoryId: _category!.id,
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          houseId: _houseId,
          priority: _priority,
          accessNotes: _accessController.text,
        );

    if (!mounted) return;

    if (!response.isSuccess) {
      setState(() {
        _busy = false;
        // The server's own words. It knows which field it refused and why.
        _error = response.message.isNotEmpty
            ? response.message
            : 'That could not be reported.';
      });
      return;
    }

    Navigator.of(context).pop(true);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response.message.isNotEmpty
            ? response.message
            : 'Reported. You will see it in the list.'),
        backgroundColor: HodiColors.successStart,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(maintenanceCategoriesProvider).value ?? const [];
    // Their own tenancies, so somebody with more than one says which unit is broken. A tenant
    // with exactly one is not asked — the answer would be the only option.
    final units = ref.watch(occupationListProvider).occupations;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: HodiColors.cardBackground,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: HodiColors.dividerStrong,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Report a repair', style: HodiTextStyles.heading3),
                const SizedBox(height: 4),
                Text(
                  'What is wrong, and since when. Somebody will pick it up from here.',
                  style: HodiTextStyles.bodySmall
                      .copyWith(color: HodiColors.textLight),
                ),
                const SizedBox(height: 18),

                DropdownButtonFormField<MaintenanceCategoryModel>(
                  initialValue: _category,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'What is it about',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    for (final c in categories)
                      DropdownMenuItem(value: c, child: Text(c.name)),
                  ],
                  onChanged: (c) => setState(() {
                    _category = c;
                    // The category's own default, which an estate sets per category — a burst
                    // pipe and a squeaking hinge do not start at the same urgency.
                    _priority = c?.defaultPriority ?? 'NORMAL';
                  }),
                ),
                const SizedBox(height: 14),

                if (units.length > 1) ...[
                  DropdownButtonFormField<String>(
                    initialValue: _houseId,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Which unit',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      for (final u in units)
                        DropdownMenuItem(
                          value: u.houseId,
                          child: Text(u.displayName),
                        ),
                    ],
                    onChanged: (id) => setState(() => _houseId = id),
                  ),
                  const SizedBox(height: 14),
                ],

                HodiTextField(
                  controller: _titleController,
                  labelText: 'In a few words',
                  hintText: 'Kitchen tap will not close',
                  textInputAction: TextInputAction.next,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Say what the problem is'
                      : null,
                ),
                const SizedBox(height: 14),
                HodiTextField(
                  controller: _descriptionController,
                  labelText: 'Describe it',
                  hintText: 'What is wrong, and since when?',
                  maxLines: 4,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'A sentence or two helps whoever comes out'
                      : null,
                ),
                const SizedBox(height: 14),

                Text('How urgent', style: HodiTextStyles.label),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    for (final p in const ['LOW', 'NORMAL', 'HIGH', 'URGENT'])
                      ChoiceChip(
                        label: Text(_priorityLabel(p)),
                        selected: _priority == p,
                        onSelected: (_) => setState(() => _priority = p),
                      ),
                  ],
                ),
                const SizedBox(height: 14),

                HodiTextField(
                  controller: _accessController,
                  labelText: 'Getting in (optional)',
                  hintText: 'Best time to call, where the key is',
                  maxLines: 2,
                ),

                if (_error != null) ...[
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: HodiColors.dangerBg,
                      borderRadius: HodiBorderRadius.small,
                    ),
                    child: Text(
                      _error!,
                      style: HodiTextStyles.bodySmall
                          .copyWith(color: HodiColors.errorStart),
                    ),
                  ),
                ],

                const SizedBox(height: 20),
                HodiGradientButton(
                  text: 'Report it',
                  isLoading: _busy,
                  onPressed: _busy ? null : _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static String _priorityLabel(String code) => switch (code) {
        'LOW' => 'Low',
        'HIGH' => 'High',
        'URGENT' => 'Urgent',
        _ => 'Normal',
      };
}
