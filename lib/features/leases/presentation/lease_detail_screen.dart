import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/utils/document_actions.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../domain/lease_models.dart';
import '../providers/lease_providers.dart';

/// One tenancy agreement: the terms, the documents, and what has changed since it was signed.
class LeaseDetailScreen extends ConsumerStatefulWidget {
  const LeaseDetailScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<LeaseDetailScreen> createState() => _LeaseDetailScreenState();
}

class _LeaseDetailScreenState extends ConsumerState<LeaseDetailScreen> {
  bool _busy = false;

  /// One behaviour for every document in the app — busy while it works, the server's own words
  /// when it does not. See [DocumentActions].
  Future<void> _download(Future<void> Function() action) => DocumentActions.run(
        context,
        action,
        onBusy: (busy) {
          if (mounted) setState(() => _busy = busy);
        },
      );

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(leaseDetailProvider(widget.id));
    final mine = ref.watch(readsOwnLeaseProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Agreement'),
      body: async.when(
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 130),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'That agreement could not be opened.',
          onRetry: () => ref.invalidate(leaseDetailProvider(widget.id)),
        ),
        data: (lease) {
          if (lease == null) {
            return const HodiErrorState(message: 'That agreement was not found.');
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _TermsCard(lease: lease),
              const SizedBox(height: 16),

              // Only where the generated agreement applies to this tenancy. An owned unit can be
              // excluded by the property's lease settings, and offering a download that would
              // come back empty is worse than not offering one.
              if (lease.agreementApplies) ...[
                _AgreementCard(
                  busy: _busy,
                  onOpen: () => _download(() => ref
                      .read(leaseRepositoryProvider)
                      .downloadAgreement(widget.id, mine: mine)),
                ),
                const SizedBox(height: 16),
              ],

              if (lease.documents.isNotEmpty) ...[
                _DocumentsCard(
                  documents: lease.documents,
                  busy: _busy,
                  onOpen: (doc) => _download(() => ref
                      .read(leaseRepositoryProvider)
                      .downloadDocument(doc, mine: mine)),
                ),
                const SizedBox(height: 16),
              ],

              if (lease.specialConditions != null &&
                  lease.specialConditions!.isNotEmpty) ...[
                _Card(
                  title: 'Special conditions',
                  child: Text(lease.specialConditions!,
                      style: HodiTextStyles.bodyMedium),
                ),
                const SizedBox(height: 16),
              ],

              if (lease.history.isNotEmpty)
                _HistoryCard(history: lease.history),
            ],
          );
        },
      ),
    );
  }
}

class _TermsCard extends StatelessWidget {
  const _TermsCard({required this.lease});

  final LeaseDetailModel lease;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lease.tenantName, style: HodiTextStyles.heading3),
          const SizedBox(height: 2),
          Text(
            [
              if (lease.unit.isNotEmpty) lease.unit,
              if (lease.propertyName != null) lease.propertyName!,
            ].join(' · '),
            style: HodiTextStyles.bodySmall,
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),
          _Row(label: 'Rent', value: 'KES ${CurrencyFormatter.format(lease.rent)}'),
          if (lease.deposit > 0)
            _Row(
              label: 'Deposit',
              value: 'KES ${CurrencyFormatter.format(lease.deposit)}',
            ),
          if (lease.refundableDeposit > 0)
            _Row(
              label: 'Refundable',
              value: 'KES ${CurrencyFormatter.format(lease.refundableDeposit)}',
            ),
          if (lease.dueDay != null)
            _Row(label: 'Rent due', value: 'Day ${lease.dueDay} of the month'),
          _Row(label: 'Occupied', value: _date(lease.occupiedOn)),
          // Absent rather than dashed: no agreed end is a periodic tenancy, which is a different
          // fact from an end date nobody recorded.
          if (lease.expiresOn != null)
            _Row(
              label: 'Ends',
              value: _date(lease.expiresOn),
              note: (lease.daysToExpiry ?? 0) < 0
                  ? 'term has passed'
                  : 'in ${lease.daysToExpiry} days',
            ),
          if (lease.noticeDays != null)
            _Row(label: 'Notice', value: '${lease.noticeDays} days'),
          _Row(label: 'Tenure', value: _tenure(lease.tenure), isLast: true),
        ],
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '-' : DateFormatter.formatDate(parsed);
  }

  static String _tenure(String? tenure) => switch (tenure) {
        'RENTAL' => 'Rental',
        'OWNED' => 'Owned',
        'BNB' => 'HODI Stays',
        _ => tenure ?? '-',
      };
}

class _AgreementCard extends StatelessWidget {
  const _AgreementCard({required this.busy, required this.onOpen});

  final bool busy;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return _Card(
      title: 'The agreement',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            // The same renderer behind the invoice and the receipt, so the copy downloaded here
            // and the copy printed at the office are the same bytes.
            'Rendered by the server, so your copy and the office\'s are identical.',
            style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: busy ? null : onOpen,
            icon: busy
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.picture_as_pdf_outlined, size: 18),
            label: const Text('Open the agreement'),
            style: OutlinedButton.styleFrom(
              foregroundColor: HodiColors.primaryStart,
              side: BorderSide(color: HodiColors.primaryStart),
              padding: const EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentsCard extends StatelessWidget {
  const _DocumentsCard({
    required this.documents,
    required this.busy,
    required this.onOpen,
  });

  final List<LeaseDocumentModel> documents;
  final bool busy;
  final void Function(LeaseDocumentModel) onOpen;

  @override
  Widget build(BuildContext context) {
    return _Card(
      title: 'Documents',
      child: Column(
        children: [
          for (final doc in documents)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.insert_drive_file_outlined,
                color: doc.superseded ? HodiColors.textFaint : HodiColors.primaryStart,
              ),
              title: Text(
                doc.label,
                style: HodiTextStyles.bodyMedium.copyWith(
                  color: doc.superseded ? HodiColors.textLight : HodiColors.textDark,
                  decoration: doc.superseded ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Text(
                [
                  // Marked, not hidden. An agreement's history is the point of keeping its
                  // documents, and a replaced version is part of it.
                  if (doc.superseded) 'Replaced',
                  if (doc.size.isNotEmpty) doc.size,
                  if (doc.uploadedOn != null) _date(doc.uploadedOn),
                ].where((s) => s.isNotEmpty).join(' · '),
                style: HodiTextStyles.bodySmall,
              ),
              trailing: const Icon(Icons.download_outlined, size: 20),
              onTap: busy ? null : () => onOpen(doc),
            ),
        ],
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '' : DateFormatter.formatDate(parsed);
  }
}

/// What has changed since it was signed.
///
/// Before and after for each thing that moved, because a rent review and a new end date are
/// different facts and a tenancy can have both on one date.
class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.history});

  final List<LeaseTermChangeModel> history;

  @override
  Widget build(BuildContext context) {
    return _Card(
      title: 'Changes to the terms',
      child: Column(
        children: [
          for (final change in history)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      color: HodiColors.primaryStart,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (change.rentMoved)
                          Text(
                            'Rent ${CurrencyFormatter.format(change.rentBefore!)} '
                            '→ ${CurrencyFormatter.format(change.rentAfter!)}',
                            style: HodiTextStyles.bodyMedium
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        if (change.expiryMoved)
                          Text(
                            'Ends ${_date(change.expiresBefore)} '
                            '→ ${_date(change.expiresAfter)}',
                            style: HodiTextStyles.bodyMedium
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        if (change.dueDayMoved)
                          Text(
                            'Due day ${change.dueDayBefore} → ${change.dueDayAfter}',
                            style: HodiTextStyles.bodyMedium
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        if (change.reason != null && change.reason!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(change.reason!,
                                style: HodiTextStyles.bodySmall),
                          ),
                        const SizedBox(height: 3),
                        Text(
                          [
                            if (change.effectiveOn != null)
                              'From ${_date(change.effectiveOn)}',
                            if (change.recordedBy != null) change.recordedBy!,
                          ].where((s) => s.isNotEmpty).join(' · '),
                          style: HodiTextStyles.bodySmall
                              .copyWith(fontSize: 11, color: HodiColors.textLight),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? 'none' : DateFormatter.formatDate(parsed);
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: HodiColors.cardBackground,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.cardLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.label,
    required this.value,
    this.note,
    this.isLast = false,
  });

  final String label;
  final String value;
  final String? note;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 92,
            child: Text(
              label,
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.textLight),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: HodiTextStyles.bodyMedium.copyWith(
                    color: HodiColors.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (note != null)
                  Text(
                    note!,
                    style: HodiTextStyles.bodySmall
                        .copyWith(fontSize: 11, color: HodiColors.textLight),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
