import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/utils/currency_formatter.dart';
import '../domain/analytics_models.dart';
import '../providers/analytics_providers.dart';

/// The dashboard's Insights: three cards from the web analytics page that are worth having on a
/// phone — who to chase, which property yields its rent, and how the nights sell.
///
/// Everything else on that page stays on the web on purpose: the full league, the waterfall and the
/// wide tables need a wide screen, and a phone copy of each would be a worse version of it.
///
/// Every card reads the last twelve months, not the month in the summary above, and says so.
class InsightsSection extends ConsumerWidget {
  const InsightsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('Insights', style: HodiTextStyles.heading3),
            const SizedBox(width: 8),
            Text('last 12 months', style: HodiTextStyles.bodySmall),
          ],
        ),
        const SizedBox(height: 12),
        const _TenantsToChaseCard(),
        const SizedBox(height: 12),
        const _RentRealisedCard(),
        const _StaysCard(),
      ],
    );
  }
}

/// Re-reads every card, for the dashboard's pull-to-refresh.
void refreshInsights(WidgetRef ref) {
  ref.invalidate(tenantsToChaseProvider);
  ref.invalidate(rentRealisedProvider);
  ref.invalidate(staysSummaryProvider);
}

// ══ Shared card frame ════════════════════════════════════════════════════════

class _InsightCard extends StatelessWidget {
  final IconData icon;
  final Color tone;
  final String title;
  final String? subtitle;
  final Widget child;

  const _InsightCard({
    required this.icon,
    required this.tone,
    required this.title,
    required this.child,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
              Icon(icon, size: 20, color: tone),
              const SizedBox(width: 8),
              Expanded(
                child: Text(title, style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
              ),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(subtitle!, style: HodiTextStyles.bodySmall),
          ],
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

/// A card's own loading and failure, so one slow read never blanks the others.
class _CardBody<T> extends StatelessWidget {
  final AsyncValue<T?> value;
  final Widget Function(T data) builder;
  final String failure;

  const _CardBody({required this.value, required this.builder, required this.failure});

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (data) => data == null ? _Quiet(failure) : builder(data),
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))),
      ),
      error: (_, _) => _Quiet(failure),
    );
  }
}

class _Quiet extends StatelessWidget {
  final String text;
  const _Quiet(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight));
  }
}

String _percent(double? rate) => rate == null ? '—' : '${rate.toStringAsFixed(rate % 1 == 0 ? 0 : 1)}%';

String _money(double amount) => 'KES ${CurrencyFormatter.formatNoDecimals(amount)}';

// ══ Tenants to chase ═════════════════════════════════════════════════════════

class _TenantsToChaseCard extends ConsumerWidget {
  const _TenantsToChaseCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _InsightCard(
      icon: Icons.person_search_outlined,
      tone: HodiColors.errorStart,
      title: 'Tenants to chase',
      subtitle: 'the lowest-ranked on paying, paying on time and how late',
      child: _CardBody<TenantsToChase>(
        value: ref.watch(tenantsToChaseProvider),
        failure: 'Could not read the tenant league.',
        builder: (data) {
          if (data.tenants.isEmpty) {
            return const _Quiet('Nobody to chase — no tenancy has enough invoices due to rank yet.');
          }
          return Column(
            children: [
              for (final t in data.tenants) _ChaseRow(tenant: t),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ranked among ${data.tenancies} tenancies. The full league is on the web.',
                  style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ChaseRow extends StatelessWidget {
  final TenantToChase tenant;
  const _ChaseRow({required this.tenant});

  String get _why {
    final parts = <String>[];
    final days = tenant.medianDaysToPay;
    if (days != null && days > 0) parts.add('$days days late, typically');
    if (tenant.onTimeRate != null) {
      parts.add('${_percent(tenant.onTimeRate)} on time (${tenant.onTime}/${tenant.dueInvoices})');
    }
    return parts.isEmpty ? 'Paid little of what was billed' : parts.join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    final canOpen = tenant.tenantUserId.isNotEmpty;
    return InkWell(
      borderRadius: HodiBorderRadius.small,
      onTap: canOpen ? () => context.push('/more/tenants/${tenant.tenantUserId}/details') : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: HodiColors.errorStart.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Text(
                '${tenant.rank ?? ''}',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: HodiColors.errorStart,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tenant.tenantName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: HodiTextStyles.labelBold.copyWith(color: HodiColors.textDark),
                  ),
                  Text(
                    [tenant.unitLabel, if (tenant.propertyName != null) tenant.propertyName!].join(' · '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: HodiTextStyles.bodySmall,
                  ),
                  Text(
                    _why,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  tenant.owed > 0 ? _money(tenant.owed) : 'Nothing owed',
                  style: HodiTextStyles.currencySmall.copyWith(
                    color: tenant.owed > 0 ? HodiColors.errorStart : HodiColors.textMedium,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (tenant.owed > 0) Text('owed now', style: HodiTextStyles.bodySmall),
              ],
            ),
            if (canOpen) ...[
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, size: 18, color: HodiColors.textLight),
            ],
          ],
        ),
      ),
    );
  }
}

// ══ Rent realised ═══════════════════════════════════════════════════════════

class _RentRealisedCard extends ConsumerStatefulWidget {
  const _RentRealisedCard();

  @override
  ConsumerState<_RentRealisedCard> createState() => _RentRealisedCardState();
}

class _RentRealisedCardState extends ConsumerState<_RentRealisedCard> {
  static const _shown = 5;
  bool _all = false;

  @override
  Widget build(BuildContext context) {
    return _InsightCard(
      icon: Icons.apartment,
      tone: HodiColors.primaryStart,
      title: 'Rent realised',
      subtitle: 'rent collected against what the rental units ask',
      child: _CardBody<RentRealised>(
        value: ref.watch(rentRealisedProvider),
        failure: 'Could not read the properties.',
        builder: (data) {
          if (data.properties.isEmpty) {
            return const _Quiet('No rental units in scope — owned units and HODI Stays have no rent roll.');
          }
          final rows = _all ? data.properties : data.properties.take(_shown).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _percent(data.realisedRate),
                    style: GoogleFonts.robotoMono(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: HodiColors.textDark,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        '${_money(data.rentCollected)} of ${_money(data.rentRoll)}',
                        style: HodiTextStyles.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              for (final p in rows) _RealisedRow(property: p),
              if (data.properties.length > _shown)
                TextButton(
                  onPressed: () => setState(() => _all = !_all),
                  child: Text(_all ? 'Show fewer' : 'Show all ${data.properties.length}'),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _RealisedRow extends StatelessWidget {
  final PropertyRealised property;
  const _RealisedRow({required this.property});

  /// Green at 90 and over, amber from 70, red below — the same bands the web table colours by.
  Color get _tone {
    final rate = property.realisedRate ?? 0;
    if (rate >= 90) return HodiColors.successStart;
    if (rate >= 70) return HodiColors.warningStart;
    return HodiColors.errorStart;
  }

  @override
  Widget build(BuildContext context) {
    final rate = property.realisedRate ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  property.propertyName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: HodiTextStyles.label.copyWith(color: HodiColors.textDark),
                ),
              ),
              Text(
                _percent(property.realisedRate),
                style: HodiTextStyles.labelBold.copyWith(color: _tone),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: HodiBorderRadius.full,
            child: LinearProgressIndicator(
              value: (rate / 100).clamp(0.0, 1.0),
              minHeight: 6,
              backgroundColor: HodiColors.surfaceLight,
              valueColor: AlwaysStoppedAnimation<Color>(_tone),
            ),
          ),
        ],
      ),
    );
  }
}

// ══ HODI Stays ══════════════════════════════════════════════════════════════

/// Only where there is a Stays unit to speak of. An estate that lets nothing by the night sees no
/// card at all, rather than a card of dashes.
class _StaysCard extends ConsumerWidget {
  const _StaysCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stays = ref.watch(staysSummaryProvider).asData?.value;
    if (stays == null || stays.units == 0) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: _InsightCard(
        icon: Icons.nights_stay_outlined,
        tone: HodiColors.accent,
        title: 'HODI Stays',
        subtitle: '${stays.units} units · ${stays.nights} of ${stays.available} nights sold',
        child: Row(
          children: [
            Expanded(child: _Figure(label: 'Occupancy', value: _percent(stays.occupancyRate))),
            Expanded(child: _Figure(label: 'ADR', value: stays.adr == null ? '—' : _money(stays.adr!), note: 'per night sold')),
            Expanded(child: _Figure(label: 'RevPAR', value: stays.revpar == null ? '—' : _money(stays.revpar!), note: 'per night available')),
          ],
        ),
      ),
    );
  }
}

class _Figure extends StatelessWidget {
  final String label;
  final String value;
  final String? note;
  const _Figure({required this.label, required this.value, this.note});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: HodiTextStyles.bodySmall),
        const SizedBox(height: 2),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(value, style: HodiTextStyles.currency.copyWith(color: HodiColors.textDark, fontWeight: FontWeight.w700)),
        ),
        if (note != null) Text(note!, style: HodiTextStyles.bodySmall.copyWith(fontSize: 10)),
      ],
    );
  }
}
