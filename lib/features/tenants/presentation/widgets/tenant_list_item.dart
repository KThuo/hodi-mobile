import 'package:flutter/material.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_gradients.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_card.dart';
import '../../domain/tenant_model.dart';

class TenantListItem extends StatelessWidget {
  const TenantListItem({super.key, required this.tenant, this.onTap});

  final TenantModel tenant;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HodiCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: HodiGradients.primary,
              borderRadius: HodiBorderRadius.small,
            ),
            child: Center(
              // An organisation is not a person, and initials on a limited company read as
              // somebody's name. The server says which, so the glyph can say it too.
              child: tenant.organisation
                  ? const Icon(Icons.business_outlined,
                      color: HodiColors.white, size: 21)
                  : Text(
                      tenant.initials,
                      style: HodiTextStyles.labelBold
                          .copyWith(color: HodiColors.white, fontSize: 15),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tenant.displayName,
                  style: HodiTextStyles.bodyLarge
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (tenant.contactLine.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    tenant.contactLine,
                    style: HodiTextStyles.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        // A tenant can occupy several units, and between tenancies, none. Both
                        // are real states, and "—" for the second is more honest than blank.
                        tenant.housed ? tenant.unitsLine : 'No current unit',
                        style: HodiTextStyles.bodySmall.copyWith(
                          fontSize: 11,
                          color: tenant.housed
                              ? HodiColors.textMedium
                              : HodiColors.textLight,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Worth showing: a tenant with no sign-in cannot see their own invoices, and
                    // that is something somebody on this screen can act on.
                    if (!tenant.invited)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: HodiColors.surfaceInset,
                          borderRadius: HodiBorderRadius.full,
                        ),
                        child: Text(
                          'No sign-in',
                          style: HodiTextStyles.bodySmall.copyWith(
                            fontSize: 10,
                            color: HodiColors.textLight,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
