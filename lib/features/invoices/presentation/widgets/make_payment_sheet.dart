import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_gradients.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/hodi_text_field.dart';
import '../../../../core/widgets/hodi_gradient_button.dart';
import '../../domain/invoice_detail_model.dart';
import '../../domain/payment_type_model.dart';
import '../../providers/invoice_providers.dart';

class MakePaymentSheet extends ConsumerStatefulWidget {
  final InvoiceDetailModel invoice;

  const MakePaymentSheet({super.key, required this.invoice});

  @override
  ConsumerState<MakePaymentSheet> createState() => _MakePaymentSheetState();
}

class _MakePaymentSheetState extends ConsumerState<MakePaymentSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _paidByController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _refNoController = TextEditingController();
  final _chequeNameController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _phoneController = TextEditingController();

  List<PaymentTypeModel> _paymentTypes = [];
  PaymentTypeModel? _selectedType;
  bool _isLoadingTypes = true;
  bool _isSubmitting = false;
  String? _typesError;

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.invoice.rentOwed.toStringAsFixed(0);
    _paidByController.text = widget.invoice.tenantName ?? '';
    _phoneController.text = _formatPhone(widget.invoice.tenantPhone ?? '');
    _loadPaymentTypes();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _paidByController.dispose();
    _descriptionController.dispose();
    _refNoController.dispose();
    _chequeNameController.dispose();
    _bankNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String _formatPhone(String phone) {
    phone = phone.replaceAll(RegExp(r'[\s+]'), '');
    if (phone.length > 8 && phone.length < 12) {
      phone = '254${phone.substring(phone.length - 9)}';
    }
    return phone;
  }

  Future<void> _loadPaymentTypes() async {
    final propertyId = widget.invoice.propertyId;
    if (propertyId == null) {
      setState(() {
        _isLoadingTypes = false;
        _typesError = 'Property information not available';
      });
      return;
    }

    final repo = ref.read(invoiceRepositoryProvider);
    final response = await repo.getPaymentTypes(
      propertyId: propertyId,
      isSelf: widget.invoice.self,
    );

    if (!mounted) return;

    if (response.isSuccess && response.data != null && response.data!.isNotEmpty) {
      setState(() {
        _paymentTypes = response.data!;
        _selectedType = _paymentTypes.first;
        _isLoadingTypes = false;
      });
    } else {
      setState(() {
        _isLoadingTypes = false;
        _typesError = response.message.isNotEmpty
            ? response.message
            : 'Payment types not configured';
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _selectedType == null) return;

    setState(() => _isSubmitting = true);

    final payload = <String, dynamic>{
      'invoiceId': widget.invoice.id,
      'amount': double.tryParse(_amountController.text) ?? 0,
      'paymentTypeId': int.tryParse(_selectedType!.typeId ?? '1') ?? 1,
      'paidBy': _paidByController.text.trim(),
      'description': _descriptionController.text.trim(),
    };

    // Method-specific fields
    if (_selectedType!.typeId == '2') {
      payload['refNo'] = _refNoController.text.trim();
      payload['bankName'] =
          '${_chequeNameController.text.trim()} (${_bankNameController.text.trim()})';
    } else if (_selectedType!.typeId == '11') {
      payload['refNo'] = _refNoController.text.trim();
    } else if (_selectedType!.typeId == '12') {
      payload['bankId'] = int.tryParse(_selectedType!.bankId ?? '');
      payload['phoneNo'] = _phoneController.text.trim();
    }

    final repo = ref.read(invoiceRepositoryProvider);
    final response = await repo.receivePayment(payload: payload);

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    if (response.isSuccess) {
      // Refresh invoice detail
      ref.invalidate(invoiceDetailProvider(widget.invoice.rrn ?? ''));

      if (mounted) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response.message.isNotEmpty
                  ? response.message
                  : 'Payment received successfully',
            ),
            backgroundColor: HodiColors.successStart,
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response.message.isNotEmpty
                  ? response.message
                  : 'Payment failed',
            ),
            backgroundColor: HodiColors.errorStart,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: HodiColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // Handle bar
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: HodiColors.divider,
                    borderRadius: HodiBorderRadius.full,
                  ),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Make Payment',
                              style: HodiTextStyles.heading3),
                          const SizedBox(height: 2),
                          Text(
                            'Amount Due: KES ${CurrencyFormatter.format(widget.invoice.rentOwed)}',
                            style: HodiTextStyles.bodySmall
                                .copyWith(color: HodiColors.textMedium),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: HodiColors.textLight),
                    ),
                  ],
                ),
              ),

              const Divider(height: 16, color: HodiColors.divider),

              // Content
              Expanded(
                child: _isLoadingTypes
                    ? Center(
                        child: CircularProgressIndicator(
                          color: HodiColors.primaryStart,
                        ),
                      )
                    : _typesError != null
                        ? _ErrorContent(
                            message: _typesError!,
                            onRetry: () {
                              setState(() {
                                _isLoadingTypes = true;
                                _typesError = null;
                              });
                              _loadPaymentTypes();
                            },
                          )
                        : _buildForm(scrollController),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildForm(ScrollController scrollController) {
    return Form(
      key: _formKey,
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 8),

          // Payment method selector
          Text('Payment Method',
              style: HodiTextStyles.labelBold.copyWith(fontSize: 13)),
          const SizedBox(height: 10),
          _PaymentMethodSelector(
            types: _paymentTypes,
            selected: _selectedType,
            onSelect: (type) {
              setState(() => _selectedType = type);
              // Reset method-specific fields
              _refNoController.clear();
              _chequeNameController.clear();
              _bankNameController.clear();
            },
          ),
          const SizedBox(height: 20),

          // Common fields
          HodiTextField(
            controller: _amountController,
            labelText: 'Amount *',
            hintText: 'Enter amount',
            keyboardType: TextInputType.number,
            prefixIcon: Icons.payments_outlined,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Amount is required';
              final amount = double.tryParse(value);
              if (amount == null || amount <= 0) return 'Enter a valid amount';
              return null;
            },
          ),
          const SizedBox(height: 14),

          HodiTextField(
            controller: _paidByController,
            labelText: 'Paid By *',
            hintText: 'Enter payer name',
            prefixIcon: Icons.person_outline,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Paid by is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 14),

          // Cheque-specific fields
          if (_selectedType?.typeId == '2') ...[
            HodiTextField(
              controller: _refNoController,
              labelText: 'Cheque Number *',
              hintText: 'Enter cheque number',
              prefixIcon: Icons.tag,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Cheque number is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            HodiTextField(
              controller: _chequeNameController,
              labelText: 'Name on Cheque *',
              hintText: 'Enter name on cheque',
              prefixIcon: Icons.badge_outlined,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Cheque name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            HodiTextField(
              controller: _bankNameController,
              labelText: 'Issuing Bank *',
              hintText: 'Enter bank name',
              prefixIcon: Icons.account_balance_outlined,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Bank name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
          ],

          // Bank slip-specific fields
          if (_selectedType?.typeId == '11') ...[
            HodiTextField(
              controller: _refNoController,
              labelText: 'Slip Reference *',
              hintText: 'Enter slip reference number',
              prefixIcon: Icons.tag,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Reference number is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
          ],

          // Bank deposit-specific fields
          if (_selectedType?.typeId == '12') ...[
            HodiTextField(
              controller: _phoneController,
              labelText: 'Phone Number *',
              hintText: 'e.g. 254712345678',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Phone number is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
          ],

          HodiTextField(
            controller: _descriptionController,
            labelText: 'Description',
            hintText: 'Add any additional notes (optional)',
            prefixIcon: Icons.notes_outlined,
            maxLines: 3,
          ),
          const SizedBox(height: 24),

          HodiGradientButton(
            text: 'Submit Payment',
            icon: Icons.send_outlined,
            isLoading: _isSubmitting,
            onPressed: _isSubmitting ? null : _submit,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// --- Payment Method Selector ---

class _PaymentMethodSelector extends StatelessWidget {
  final List<PaymentTypeModel> types;
  final PaymentTypeModel? selected;
  final ValueChanged<PaymentTypeModel> onSelect;

  const _PaymentMethodSelector({
    required this.types,
    required this.selected,
    required this.onSelect,
  });

  IconData _iconForType(PaymentTypeModel type) {
    switch (type.typeId) {
      case '1':
        return Icons.money;
      case '2':
        return Icons.receipt_outlined;
      case '11':
        return Icons.receipt_long_outlined;
      case '12':
        return Icons.account_balance_outlined;
      default:
        return Icons.payment;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: types.map((type) {
        final isSelected = selected?.typeId == type.typeId &&
            selected?.bankId == type.bankId;
        return GestureDetector(
          onTap: () => onSelect(type),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              gradient: isSelected ? HodiGradients.primary : null,
              color: isSelected ? null : HodiColors.cardBackground,
              borderRadius: HodiBorderRadius.small,
              border: Border.all(
                color: isSelected
                    ? Colors.transparent
                    : HodiColors.divider,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _iconForType(type),
                  size: 16,
                  color: isSelected ? HodiColors.white : HodiColors.textMedium,
                ),
                const SizedBox(width: 6),
                Text(
                  type.displayName,
                  style: HodiTextStyles.bodySmall.copyWith(
                    color:
                        isSelected ? HodiColors.white : HodiColors.textDark,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// --- Error Content ---

class _ErrorContent extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorContent({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline,
                size: 48, color: HodiColors.errorStart.withValues(alpha: 0.6)),
            const SizedBox(height: 16),
            Text(
              message,
              style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textMedium),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
