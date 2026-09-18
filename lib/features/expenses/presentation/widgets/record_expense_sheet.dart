import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/filters/filter_provider.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/hodi_gradient_button.dart';
import '../../../../core/widgets/hodi_text_field.dart';
import '../../domain/expense_model.dart';
import '../../providers/expense_providers.dart';

/// Recording what something cost, or correcting it.
///
/// One sheet for both: the fields are identical and the server takes the same body, so a second
/// screen would be the same form with a different title.
class RecordExpenseSheet extends ConsumerStatefulWidget {
  const RecordExpenseSheet({super.key, this.existing});

  /// The line being corrected, where this is an edit.
  final ExpenseModel? existing;

  @override
  ConsumerState<RecordExpenseSheet> createState() => _RecordExpenseSheetState();
}

class _RecordExpenseSheetState extends ConsumerState<RecordExpenseSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _category = 'REPAIR';
  String? _propertyId;
  late DateTime _incurredOn;
  bool _busy = false;
  String? _error;

  bool get _editing => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _nameController.text = e?.name ?? '';
    _amountController.text = e == null ? '' : e.amount.toStringAsFixed(0);
    _descriptionController.text = e?.description ?? '';
    _category = e?.category ?? 'REPAIR';
    _propertyId = e?.propertyId ?? ref.read(filterProvider).selectedPropertyId;
    _incurredOn = DateFormatter.parseApiDate(e?.incurredOn) ?? DateTime.now();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _incurredOn,
      firstDate: DateTime(DateTime.now().year - 3),
      // No future dates. An expense is something that has happened.
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _incurredOn = picked);
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_propertyId == null) {
      setState(() => _error = 'Choose the property this was spent on.');
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
    });

    final repo = ref.read(expenseRepositoryProvider);
    final amount = double.tryParse(_amountController.text.trim()) ?? 0;
    final on = DateFormatter.formatForApi(_incurredOn);

    final response = _editing
        ? await repo.update(
            id: widget.existing!.id,
            propertyId: _propertyId!,
            name: _nameController.text.trim(),
            amount: amount,
            category: _category,
            incurredOn: on,
            description: _descriptionController.text,
          )
        : await repo.record(
            propertyId: _propertyId!,
            name: _nameController.text.trim(),
            amount: amount,
            category: _category,
            incurredOn: on,
            description: _descriptionController.text,
          );

    if (!mounted) return;

    if (!response.isSuccess) {
      setState(() {
        _busy = false;
        // The server names the field it refused — "An expense cannot be negative", "Choose what
        // kind of cost this is" — and that is more use than anything this sheet could invent.
        _error = response.message.isNotEmpty
            ? response.message
            : 'That could not be saved.';
      });
      return;
    }

    Navigator.of(context).pop(true);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.message.isNotEmpty
          ? response.message
          : _editing ? 'Expense updated.' : 'Expense recorded.'),
      backgroundColor: HodiColors.successStart,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final properties = ref.watch(filterProvider).properties;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                Text(_editing ? 'Correct this expense' : 'Record an expense',
                    style: HodiTextStyles.heading3),
                const SizedBox(height: 18),

                DropdownButtonFormField<String>(
                  initialValue: _propertyId,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Property',
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    for (final p in properties)
                      DropdownMenuItem(value: p.id, child: Text(p.label)),
                  ],
                  onChanged: (id) => setState(() => _propertyId = id),
                ),
                const SizedBox(height: 14),

                HodiTextField(
                  controller: _nameController,
                  labelText: 'What it was for',
                  hintText: 'Replacement borehole pump',
                  textInputAction: TextInputAction.next,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Say what this was for' : null,
                ),
                const SizedBox(height: 14),

                HodiTextField(
                  controller: _amountController,
                  labelText: 'Amount',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    final amount = double.tryParse((v ?? '').trim());
                    if (amount == null) return 'Enter the amount';
                    // The server refuses a negative; saying so here saves the round trip.
                    if (amount < 0) return 'An expense cannot be negative';
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                Text('What kind of cost', style: HodiTextStyles.label),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    for (final c in expenseCategories)
                      ChoiceChip(
                        label: Text(c.label),
                        selected: _category == c.code,
                        onSelected: (_) => setState(() => _category = c.code),
                      ),
                  ],
                ),
                const SizedBox(height: 14),

                // Always asked, never assumed. Somebody entering a receipt on Tuesday for a
                // Saturday callout wants Saturday, and a date that is usually right is worse than
                // one that was asked for.
                InkWell(
                  onTap: _pickDate,
                  borderRadius: HodiBorderRadius.small,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'When it was incurred',
                      border: OutlineInputBorder(),
                    ),
                    child: Row(
                      children: [
                        Text(DateFormatter.formatDate(_incurredOn),
                            style: HodiTextStyles.bodyMedium),
                        const Spacer(),
                        const Icon(Icons.calendar_today_outlined, size: 18),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                HodiTextField(
                  controller: _descriptionController,
                  labelText: 'Notes (optional)',
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
                  text: _editing ? 'Save changes' : 'Record it',
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
}
