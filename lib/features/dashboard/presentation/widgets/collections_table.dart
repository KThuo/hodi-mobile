import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_shadows.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../payments/domain/payment_model.dart';

class CollectionsTable extends StatefulWidget {
  final List<PaymentModel> payments;
  final bool isAdmin;

  const CollectionsTable({
    super.key,
    required this.payments,
    required this.isAdmin,
  });

  @override
  State<CollectionsTable> createState() => _CollectionsTableState();
}

class _CollectionsTableState extends State<CollectionsTable> {
  static const _pageSize = 5;
  int _currentPage = 0;
  String _searchTerm = '';

  List<PaymentModel> get _filtered {
    if (_searchTerm.isEmpty) return widget.payments;
    final term = _searchTerm.toLowerCase();
    return widget.payments.where((p) {
      return (p.paymentRrn?.toLowerCase().contains(term) ?? false) ||
          (p.houseName?.toLowerCase().contains(term) ?? false) ||
          (p.tenantName?.toLowerCase().contains(term) ?? false) ||
          (p.property?.toLowerCase().contains(term) ?? false);
    }).toList();
  }

  List<PaymentModel> get _paged {
    final start = _currentPage * _pageSize;
    if (start >= _filtered.length) return [];
    return _filtered.sublist(
      start,
      (start + _pageSize).clamp(0, _filtered.length),
    );
  }

  int get _totalPages => (_filtered.length / _pageSize).ceil();

  @override
  void didUpdateWidget(covariant CollectionsTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.payments != widget.payments) {
      _currentPage = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.list_alt, size: 20, color: HodiColors.primaryStart),
              const SizedBox(width: 8),
              Text(
                'Payment Collections',
                style: HodiTextStyles.heading3.copyWith(fontSize: 16),
              ),
              const Spacer(),
              Text(
                '${_filtered.length} records',
                style: HodiTextStyles.bodySmall,
              ),
            ],
          ),

          // Tenant search
          if (!widget.isAdmin) ...[
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search payments...',
                hintStyle: HodiTextStyles.bodyMedium,
                prefixIcon: const Icon(Icons.search, size: 20, color: HodiColors.textLight),
                filled: true,
                fillColor: HodiColors.surfaceLight,
                border: OutlineInputBorder(
                  borderRadius: HodiBorderRadius.input,
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                isDense: true,
              ),
              style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textDark),
              onChanged: (value) {
                setState(() {
                  _searchTerm = value;
                  _currentPage = 0;
                });
              },
            ),
          ],

          const SizedBox(height: 12),

          if (_paged.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text('No payments found', style: HodiTextStyles.bodyMedium),
              ),
            )
          else
            ..._paged.map((payment) => _PaymentRow(
                  payment: payment,
                  isAdmin: widget.isAdmin,
                )),

          if (_totalPages > 1) ...[
            const SizedBox(height: 12),
            const Divider(height: 1, color: HodiColors.divider),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left, size: 20),
                  onPressed: _currentPage > 0
                      ? () => setState(() => _currentPage--)
                      : null,
                  visualDensity: VisualDensity.compact,
                ),
                Text(
                  'Page ${_currentPage + 1} of $_totalPages',
                  style: HodiTextStyles.labelBold,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, size: 20),
                  onPressed: _currentPage < _totalPages - 1
                      ? () => setState(() => _currentPage++)
                      : null,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _PaymentRow extends StatelessWidget {
  final PaymentModel payment;
  final bool isAdmin;

  const _PaymentRow({required this.payment, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: HodiColors.surfaceLight,
        borderRadius: HodiBorderRadius.small,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row: RRN + month
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  payment.paymentRrn ?? '-',
                  style: GoogleFonts.robotoMono(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: HodiColors.primaryStart,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (payment.monthName != null)
                Text(
                  payment.monthName!,
                  style: HodiTextStyles.bodySmall,
                ),
            ],
          ),
          const SizedBox(height: 6),

          // Property info row
          Row(
            children: [
              Expanded(
                child: Text(
                  payment.houseName ?? '-',
                  style: HodiTextStyles.labelBold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isAdmin && payment.tenantName != null)
                Expanded(
                  child: Text(
                    payment.tenantName!,
                    style: HodiTextStyles.bodySmall,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              if (!isAdmin && payment.category != null)
                Text(
                  payment.category!,
                  style: HodiTextStyles.bodySmall,
                ),
            ],
          ),
          const SizedBox(height: 6),

          // Property name
          if (payment.property != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                payment.property!,
                style: HodiTextStyles.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),

          // Amounts + date row
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text('Owed: ', style: HodiTextStyles.bodySmall),
                    Flexible(
                      child: Text(
                        'KES ${CurrencyFormatter.format(payment.rentOwed)}',
                        style: HodiTextStyles.currencySmall.copyWith(color: HodiColors.warningStart),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Paid: ', style: HodiTextStyles.bodySmall),
                    Flexible(
                      child: Text(
                        'KES ${CurrencyFormatter.format(payment.rentPaid)}',
                        style: HodiTextStyles.currencySmall.copyWith(color: HodiColors.successStart),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (payment.paidOn != null) ...[
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Paid on: ${payment.paidOn}',
                style: HodiTextStyles.bodySmall.copyWith(fontSize: 10),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
