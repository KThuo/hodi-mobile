import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../providers/tenant_providers.dart';
import 'widgets/tenant_list_item.dart';

class TenantsScreen extends ConsumerStatefulWidget {
  const TenantsScreen({super.key});

  @override
  ConsumerState<TenantsScreen> createState() => _TenantsScreenState();
}

class _TenantsScreenState extends ConsumerState<TenantsScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(tenantListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(tenantListProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Tenants', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () => ref.read(tenantListProvider.notifier).refresh(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HodiSearchBar(
                controller: _searchController,
                hintText: 'Search tenants...',
                onChanged: (value) {
                  ref.read(tenantListProvider.notifier).search(value);
                },
                onClear: () {
                  ref.read(tenantListProvider.notifier).search('');
                },
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: _buildList(state)),
          ],
        ),
      ),
    );
  }

  Widget _buildList(TenantListState state) {
    if (state.isLoading && state.tenants.isEmpty) {
      return const HodiLoadingShimmer();
    }

    if (state.error != null && state.tenants.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(tenantListProvider.notifier).refresh(),
      );
    }

    if (state.tenants.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.people_outlined,
        title: 'No Tenants Found',
        subtitle: 'Try adjusting your search',
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: state.tenants.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.tenants.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator(color: HodiColors.primaryStart)),
          );
        }
        final tenant = state.tenants[index];
        return TenantListItem(
          tenant: tenant,
          onTap: () {
            if (tenant.userId != null) {
              context.push('/more/tenants/${tenant.userId}/details');
            }
          },
        );
      },
    );
  }
}
