import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/contact_actions.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../occupations/domain/occupation_model.dart';
import '../domain/tenant_detail_model.dart';
import '../providers/tenant_providers.dart';

/// One tenant: who they are, what they occupy, and where they have been.
///
/// **The money lives on the tenancies, not on the tenant.** `TenantDetail` sends `current` as a
/// list of `OccupationRow` — each with its own rent, deposit and arrears — because a tenant can
/// hold more than one, and a single balance on the person would have to sum them silently. The
/// totals here are summed from the rows shown, so somebody can check them.
class TenantDetailScreen extends ConsumerWidget {
  const TenantDetailScreen({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(tenantDetailProvider(userId));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Tenant'),
      body: async.when(
        loading: () => const HodiLoadingShimmer(itemCount: 3, itemHeight: 140),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'That tenant could not be loaded.',
          onRetry: () => ref.invalidate(tenantDetailProvider(userId)),
        ),
        data: (detail) {
          if (detail == null) {
            return const HodiErrorState(message: 'That tenant was not found.');
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _HeaderCard(detail: detail),
              const SizedBox(height: 16),
              if (detail.current.isNotEmpty) ...[
                _Section(
                  title: detail.current.length == 1
                      ? 'Current tenancy'
                      : '${detail.current.length} current tenancies',
                  child: Column(
                    children: [
                      for (final o in detail.current) _TenancyRow(occupation: o),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
              if (detail.history.isNotEmpty)
                _Section(
                  title: 'Previously',
                  child: Column(
                    children: [
                      for (final h in detail.history) _HistoryRow(history: h),
                    ],
                  ),
                ),
              // The server names what it has not computed rather than sending zeroes, and the
              // screen says so rather than showing a confident nought.
              if (detail.pending.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  'Not yet available: ${detail.pending.join(', ')}.',
                  style: HodiTextStyles.bodySmall
                      .copyWith(color: HodiColors.textLight),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.detail});

  final TenantDetailModel detail;

  @override
  Widget build(BuildContext context) {
    final t = detail.tenant;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: HodiGradients.primary,
        borderRadius: HodiBorderRadius.card,
        boxShadow: HodiShadows.card,
      ),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: HodiColors.white.withValues(alpha: 0.2),
              borderRadius: HodiBorderRadius.small,
            ),
            child: Center(
              child: t.organisation
                  ? const Icon(Icons.business_outlined,
                      color: HodiColors.white, size: 27)
                  : Text(
                      t.initials,
                      style: HodiTextStyles.heading2
                          .copyWith(color: HodiColors.white),
                    ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            t.displayName,
            style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
            textAlign: TextAlign.center,
          ),
          if (t.contactName != null && t.contactName!.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              'Contact: ${t.contactName}',
              style: HodiTextStyles.bodySmall
                  .copyWith(color: HodiColors.white.withValues(alpha: 0.85)),
            ),
          ],
          const SizedBox(height: 14),

          // Reaching somebody is the commonest reason to open a tenant, so it is a tap rather
          // than a number to read out and retype.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (t.phone != null && t.phone!.isNotEmpty) ...[
                _Action(
                  icon: Icons.phone_outlined,
                  label: 'Call',
                  onTap: () => ContactActions.call(t.phone),
                ),
                const SizedBox(width: 10),
                _Action(
                  icon: Icons.chat_bubble_outline,
                  label: 'WhatsApp',
                  onTap: () => ContactActions.whatsApp(
                    t.phone,
                    'Hello ${t.displayName},',
                  ),
                ),
              ],
              if (t.email != null && t.email!.isNotEmpty) ...[
                const SizedBox(width: 10),
                _Action(
                  icon: Icons.mail_outline,
                  label: 'Email',
                  onTap: () => ContactActions.email(t.email),
                ),
              ],
            ],
          ),

          if (detail.current.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Divider(height: 1, color: Colors.white24),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _Figure(
                    label: 'Rent',
                    amount: detail.totalRent,
                  ),
                ),
                Container(width: 1, height: 32, color: Colors.white24),
                Expanded(
                  child: _Figure(
                    // One column with a sign, named by which side of nought it falls.
                    label: detail.inArrears ? 'Owing' : 'In credit',
                    amount: detail.totalOwed.abs(),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _Action extends StatelessWidget {
  const _Action({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: HodiBorderRadius.full,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: HodiColors.white.withValues(alpha: 0.18),
          borderRadius: HodiBorderRadius.full,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: HodiColors.white),
            const SizedBox(width: 6),
            Text(
              label,
              style: HodiTextStyles.bodySmall.copyWith(
                color: HodiColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Figure extends StatelessWidget {
  const _Figure({required this.label, required this.amount});

  final String label;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: HodiTextStyles.bodySmall
              .copyWith(color: HodiColors.white.withValues(alpha: 0.75)),
        ),
        const SizedBox(height: 2),
        Text(
          'KES ${CurrencyFormatter.format(amount)}',
          style: HodiTextStyles.currency
              .copyWith(fontSize: 15, color: HodiColors.white),
        ),
      ],
    );
  }
}

class _TenancyRow extends StatelessWidget {
  const _TenancyRow({required this.occupation});

  final OccupationModel occupation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  occupation.displayName,
                  style: HodiTextStyles.bodyMedium
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  [
                    if (occupation.propertyName != null) occupation.propertyName!,
                    'since ${_date(occupation.occupiedOn)}',
                  ].join(' · '),
                  style: HodiTextStyles.bodySmall,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'KES ${CurrencyFormatter.format(occupation.rent)}',
                style: HodiTextStyles.currency.copyWith(fontSize: 14),
              ),
              if (occupation.rentOwed != 0)
                Text(
                  occupation.inArrears
                      ? 'owes ${CurrencyFormatter.format(occupation.rentOwed)}'
                      : 'credit ${CurrencyFormatter.format(-occupation.rentOwed)}',
                  style: HodiTextStyles.bodySmall.copyWith(
                    fontSize: 11,
                    color: occupation.inArrears
                        ? HodiColors.errorStart
                        : HodiColors.successEnd,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  static String _date(String? raw) {
    final parsed = DateFormatter.parseApiDate(raw);
    return parsed == null ? '-' : DateFormatter.formatDate(parsed);
  }
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.history});

  final TenancyHistoryModel history;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6),
            decoration: const BoxDecoration(
              color: HodiColors.dividerStrong,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  history.unit,
                  style: HodiTextStyles.bodyMedium
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 2),
                Text(
                  [
                    if (history.propertyName != null) history.propertyName!,
                    '${_date(history.occupiedOn)} → ${_date(history.vacatedOn)}',
                    // Nights read badly past a few weeks; months are what somebody says.
                    if (history.duration.isNotEmpty) history.duration,
                  ].join(' · '),
                  style: HodiTextStyles.bodySmall,
                ),
                if (history.reason != null && history.reason!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      history.reason!,
                      style: HodiTextStyles.bodySmall
                          .copyWith(fontSize: 11, color: HodiColors.textLight),
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
    return parsed == null ? 'now' : DateFormatter.formatDate(parsed);
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});

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
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}
