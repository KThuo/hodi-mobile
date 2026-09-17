import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/widgets/hodi_app_bar.dart';
import '../../../core/widgets/hodi_amount_text.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../../../core/map/static_map_view.dart';
import '../domain/vacant_house_detail_model.dart';
import 'widgets/listing_contact_card.dart';
import '../providers/vacant_house_providers.dart';

class VacantHouseDetailScreen extends ConsumerWidget {
  final String houseId;

  const VacantHouseDetailScreen({super.key, required this.houseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(vacantHouseDetailProvider(houseId));

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'House Details'),
      body: detailAsync.when(
        data: (detail) {
          if (detail == null) {
            return const HodiErrorState(message: 'House not found');
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _ImageCarousel(images: detail.categoryImages, fallbackUrl: detail.imageUrl),
                const SizedBox(height: 16),
                _HouseHeaderCard(detail: detail),
                const SizedBox(height: 16),
                _HouseInfoCard(detail: detail),
                // Collapses to nothing when the listing has no coordinates, or the deployment
                // has no maps key. Neither is a fault worth a grey box on somebody's listing.
                StaticMapView(
                  latitude: detail.latitude,
                  longitude: detail.longitude,
                  label: detail.houseName ?? detail.location ?? 'Location',
                ),
                if (detail.latitude != null && detail.longitude != null)
                  const SizedBox(height: 16),
                if (detail.houseFeatures.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _AmenitiesCard(features: detail.houseFeatures),
                ],
                if (detail.utilityBills.isNotEmpty || detail.onboardFees.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _BillsFeesCard(detail: detail),
                ],
                const SizedBox(height: 16),
                _CostSummaryCard(detail: detail),
                if (detail.hasContact) ...[
                  const SizedBox(height: 16),
                  ListingContactCard(detail: detail),
                ],
                const SizedBox(height: 24),
              ],
            ),
          );
        },
        loading: () => const HodiLoadingShimmer(itemCount: 4, itemHeight: 120),
        error: (e, _) => HodiErrorState(
          message: e is Exception
              ? e.toString().replaceFirst('Exception: ', '')
              : 'Failed to load details',
          onRetry: () => ref.invalidate(vacantHouseDetailProvider(houseId)),
        ),
      ),
    );
  }
}

// --- Image Carousel ---

class _ImageCarousel extends StatefulWidget {
  final List<VacantHouseImage> images;
  final String? fallbackUrl;

  const _ImageCarousel({required this.images, this.fallbackUrl});

  @override
  State<_ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<_ImageCarousel> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> get _imageUrls {
    final urls = widget.images
        .map((img) {
          if (img.imageUrl == null || img.imageUrl!.isEmpty) return null;
          return img.imageUrl!.startsWith('http')
              ? img.imageUrl!
              : '${ApiConstants.baseUrl}${img.imageUrl}';
        })
        .whereType<String>()
        .toList();

    if (urls.isEmpty && widget.fallbackUrl != null && widget.fallbackUrl!.isNotEmpty) {
      final url = widget.fallbackUrl!.startsWith('http')
          ? widget.fallbackUrl!
          : '${ApiConstants.baseUrl}${widget.fallbackUrl}';
      urls.add(url);
    }
    return urls;
  }

  @override
  Widget build(BuildContext context) {
    final urls = _imageUrls;

    if (urls.isEmpty) {
      return Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HodiColors.primaryStart.withValues(alpha: 0.15),
              HodiColors.primaryEnd.withValues(alpha: 0.08),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: HodiBorderRadius.card,
        ),
        child: const Center(
          child: Icon(Icons.home_work_outlined, size: 64, color: HodiColors.textLight),
        ),
      );
    }

    return ClipRRect(
      borderRadius: HodiBorderRadius.card,
      child: SizedBox(
        height: 220,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (i) => setState(() => _currentPage = i),
              itemCount: urls.length,
              itemBuilder: (context, index) {
                return Image.network(
                  urls[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (_, _, _) => Container(
                    color: HodiColors.surfaceLight,
                    child: const Center(
                      child: Icon(Icons.broken_image_outlined, size: 48, color: HodiColors.textLight),
                    ),
                  ),
                );
              },
            ),
            // Dot indicators
            if (urls.length > 1)
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(urls.length, (i) {
                    return Container(
                      width: _currentPage == i ? 20 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: _currentPage == i
                            ? HodiColors.white
                            : HodiColors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
              ),
            // Counter badge
            if (urls.length > 1)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: HodiColors.black.withValues(alpha: 0.6),
                    borderRadius: HodiBorderRadius.badge,
                  ),
                  child: Text(
                    '${_currentPage + 1}/${urls.length}',
                    style: HodiTextStyles.bodySmall.copyWith(
                      color: HodiColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// --- Header Card ---

class _HouseHeaderCard extends StatelessWidget {
  final VacantHouseDetailModel detail;

  const _HouseHeaderCard({required this.detail});

  @override
  Widget build(BuildContext context) {
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
          Text(
            detail.houseName ?? detail.houseNumber ?? 'Vacant House',
            style: HodiTextStyles.heading2.copyWith(color: HodiColors.white),
            textAlign: TextAlign.center,
          ),
          if (detail.property != null || detail.estate != null) ...[
            const SizedBox(height: 4),
            Text(
              [detail.property, detail.estate].whereType<String>().join(' - '),
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.white.withValues(alpha: 0.8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: 14),
          Text(
            'Monthly Rent',
            style: HodiTextStyles.bodySmall.copyWith(
              color: HodiColors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 2),
          HodiAmountText(
            amount: detail.rent,
            style: HodiTextStyles.currencyLarge.copyWith(color: HodiColors.white),
          ),
        ],
      ),
    );
  }
}

// --- House Info Card ---

class _HouseInfoCard extends StatelessWidget {
  final VacantHouseDetailModel detail;

  const _HouseInfoCard({required this.detail});

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
          _SectionHeader(
            icon: Icons.info_outline,
            title: 'Property Details',
            color: HodiColors.primaryStart,
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),
          const SizedBox(height: 16),
          if (detail.houseType != null)
            _DetailRow(icon: Icons.category_outlined, label: 'Type', value: detail.houseType!),
          if (detail.category != null)
            _DetailRow(icon: Icons.meeting_room_outlined, label: 'Category', value: detail.category!),
          if (detail.floor != null && detail.floor! > 0)
            _DetailRow(icon: Icons.layers_outlined, label: 'Floor', value: _floorLabel(detail.floor!)),
          if (detail.squareFt != null)
            _DetailRow(icon: Icons.square_foot_outlined, label: 'Size', value: '${detail.squareFt!.toStringAsFixed(0)} sq ft'),
          if (detail.location != null)
            _DetailRow(icon: Icons.location_on_outlined, label: 'Location', value: detail.location!),
          if (detail.lastOccupied != null && detail.lastOccupied != 'N/A')
            _DetailRow(icon: Icons.event_outlined, label: 'Last Occupied', value: detail.lastOccupied!),
          if (detail.property != null)
            _DetailRow(icon: Icons.apartment_outlined, label: 'Property', value: detail.property!),
          if (detail.estate != null)
            _DetailRow(icon: Icons.domain_outlined, label: 'Estate', value: detail.estate!, isLast: true),
        ],
      ),
    );
  }

  String _floorLabel(int floor) {
    if (floor == 0) return 'Ground';
    if (floor == 1) return '1st';
    if (floor == 2) return '2nd';
    if (floor == 3) return '3rd';
    return '${floor}th';
  }
}

// --- Amenities Card ---

class _AmenitiesCard extends StatelessWidget {
  final List<VacantHouseFeature> features;

  const _AmenitiesCard({required this.features});

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
          const _SectionHeader(
            icon: Icons.star_outline,
            title: 'Amenities',
            color: HodiColors.warningStart,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            children: features
                .where((f) => f.name != null && f.name!.isNotEmpty)
                .map((f) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: HodiColors.primaryStart.withValues(alpha: 0.08),
                        borderRadius: HodiBorderRadius.full,
                        border: Border.all(
                          color: HodiColors.primaryStart.withValues(alpha: 0.15),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.check_circle, size: 14, color: HodiColors.successStart),
                          const SizedBox(width: 6),
                          Text(
                            f.name!,
                            style: HodiTextStyles.bodySmall.copyWith(
                              color: HodiColors.primaryStart,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

// --- Bills & Fees Card ---

class _BillsFeesCard extends StatelessWidget {
  final VacantHouseDetailModel detail;

  const _BillsFeesCard({required this.detail});

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
          _SectionHeader(
            icon: Icons.receipt_long_outlined,
            title: 'Bills & Fees',
            color: HodiColors.secondary,
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: HodiColors.divider),

          // Monthly utility bills
          if (detail.utilityBills.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Monthly Utility Bills',
              style: HodiTextStyles.labelBold.copyWith(color: HodiColors.textMedium),
            ),
            const SizedBox(height: 10),
            ...detail.utilityBills.map((bill) => _BillRow(
                  name: bill.name ?? '-',
                  amount: bill.amount,
                )),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: HodiColors.surfaceLight,
                borderRadius: HodiBorderRadius.small,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Monthly Total',
                    style: HodiTextStyles.labelBold.copyWith(color: HodiColors.textDark),
                  ),
                  HodiAmountText(
                    amount: detail.totalMonthlyBills,
                    style: HodiTextStyles.currency.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],

          // New let / onboard fees
          if (detail.onboardFees.isNotEmpty) ...[
            const SizedBox(height: 20),
            Text(
              'New Let Fees',
              style: HodiTextStyles.labelBold.copyWith(color: HodiColors.textMedium),
            ),
            const SizedBox(height: 10),
            ...detail.onboardFees.map((fee) => _BillRow(
                  name: fee.name ?? '-',
                  amount: fee.amount,
                )),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: HodiColors.surfaceLight,
                borderRadius: HodiBorderRadius.small,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fees Total',
                    style: HodiTextStyles.labelBold.copyWith(color: HodiColors.textDark),
                  ),
                  HodiAmountText(
                    amount: detail.totalOnboardFees,
                    style: HodiTextStyles.currency.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],

          // Max refundable
          if (detail.maxRefundableAmount > 0) ...[
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: HodiColors.successStart.withValues(alpha: 0.08),
                borderRadius: HodiBorderRadius.small,
                border: Border.all(color: HodiColors.successStart.withValues(alpha: 0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Max Refundable',
                    style: HodiTextStyles.labelBold.copyWith(color: HodiColors.successStart),
                  ),
                  HodiAmountText(
                    amount: detail.maxRefundableAmount,
                    style: HodiTextStyles.currency.copyWith(
                      fontSize: 14,
                      color: HodiColors.successStart,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _BillRow extends StatelessWidget {
  final String name;
  final double amount;

  const _BillRow({required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              name,
              style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textDark),
            ),
          ),
          HodiAmountText(
            amount: amount,
            style: HodiTextStyles.currencySmall.copyWith(color: HodiColors.textDark),
          ),
        ],
      ),
    );
  }
}

// --- Cost Summary Card ---

class _CostSummaryCard extends StatelessWidget {
  final VacantHouseDetailModel detail;

  const _CostSummaryCard({required this.detail});

  @override
  Widget build(BuildContext context) {
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
          Text(
            'Move-in Cost Summary',
            style: HodiTextStyles.labelBold.copyWith(
              color: HodiColors.white.withValues(alpha: 0.8),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 16),
          _CostRow(label: 'Monthly Rent', amount: detail.rent),
          if (detail.totalMonthlyBills > 0)
            _CostRow(label: 'Monthly Bills', amount: detail.totalMonthlyBills),
          if (detail.totalOnboardFees > 0)
            _CostRow(label: 'Initial Fees', amount: detail.totalOnboardFees),
          const SizedBox(height: 12),
          Container(
            height: 1,
            color: HodiColors.white.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Move-in',
                style: HodiTextStyles.bodyLarge.copyWith(
                  color: HodiColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              HodiAmountText(
                amount: detail.totalMoveInCost,
                style: HodiTextStyles.currencyLarge.copyWith(
                  color: HodiColors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CostRow extends StatelessWidget {
  final String label;
  final double amount;

  const _CostRow({required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: HodiTextStyles.bodyMedium.copyWith(
              color: HodiColors.white.withValues(alpha: 0.8),
            ),
          ),
          HodiAmountText(
            amount: amount,
            style: HodiTextStyles.currency.copyWith(
              color: HodiColors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// --- Shared widgets ---

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: HodiBorderRadius.small,
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 10),
        Text(title, style: HodiTextStyles.heading3.copyWith(fontSize: 16)),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: HodiColors.textLight),
          const SizedBox(width: 10),
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: HodiTextStyles.label.copyWith(
                color: HodiColors.textLight,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: HodiTextStyles.bodyMedium.copyWith(
                color: HodiColors.textDark,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
