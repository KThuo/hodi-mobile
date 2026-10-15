import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_app_bar.dart';
import '../../../../core/widgets/hodi_empty_state.dart';
import '../../../../core/widgets/hodi_error_state.dart';
import '../../../../core/widgets/hodi_loading_shimmer.dart';
import '../../domain/pass_model.dart';
import '../../providers/visit_providers.dart';
import 'pass_widgets.dart';

/// The passes the host has sent, the ones still to use first.
class MyPassesScreen extends ConsumerWidget {
  const MyPassesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passes = ref.watch(myPassesProvider);
    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'My passes'),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/more/visitors/invite'),
        backgroundColor: HodiColors.primaryStart,
        foregroundColor: HodiColors.white,
        icon: const Icon(Icons.add),
        label: const Text('Invite'),
      ),
      body: passes.when(
        loading: () => const HodiLoadingShimmer(itemCount: 4, itemHeight: 90),
        error: (e, _) => HodiErrorState(
          message: e.toString().replaceFirst('Exception: ', ''),
          onRetry: () => ref.invalidate(myPassesProvider),
        ),
        data: (list) => list.isEmpty
            ? const HodiEmptyState(
                icon: Icons.qr_code_2,
                title: 'No passes yet',
                subtitle: 'Invite somebody and send them a pass for the gate',
              )
            : RefreshIndicator(
                color: HodiColors.primaryStart,
                onRefresh: () async => ref.invalidate(myPassesProvider),
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
                  itemCount: list.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, i) => _PassTile(
                    pass: list[i],
                    onTap: () => context.push('/more/visitors/pass', extra: list[i]),
                  ),
                ),
              ),
      ),
    );
  }
}

class _PassTile extends StatelessWidget {
  final PassModel pass;
  final VoidCallback onTap;

  const _PassTile({required this.pass, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: HodiColors.cardBackground,
      borderRadius: HodiBorderRadius.card,
      child: InkWell(
        borderRadius: HodiBorderRadius.card,
        onTap: onTap,
        child: Opacity(
          opacity: pass.current ? 1 : 0.6,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        pass.visitorName,
                        style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(passDays(pass), style: HodiTextStyles.bodySmall),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  [
                    if (pass.visitorCount > 1) '${pass.visitorCount} people',
                    if (pass.vehicleReg != null && pass.vehicleReg!.isNotEmpty) pass.vehicleReg!,
                    pass.passCode,
                  ].join(' · '),
                  style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
                ),
                const SizedBox(height: 10),
                PassStateBanner(pass: pass),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
