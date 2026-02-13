import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/widgets/hodi_search_bar.dart';
import '../../../core/widgets/hodi_loading_shimmer.dart';
import '../../../core/widgets/hodi_empty_state.dart';
import '../../../core/widgets/hodi_error_state.dart';
import '../providers/property_providers.dart';
import 'widgets/property_list_item.dart';

class PropertiesScreen extends ConsumerStatefulWidget {
  const PropertiesScreen({super.key});

  @override
  ConsumerState<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends ConsumerState<PropertiesScreen> {
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
      ref.read(propertyListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(propertyListProvider);

    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: AppBar(
        title: Text('Properties', style: HodiTextStyles.heading3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        color: HodiColors.primaryStart,
        onRefresh: () => ref.read(propertyListProvider.notifier).refresh(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HodiSearchBar(
                controller: _searchController,
                hintText: 'Search properties...',
                onChanged: (value) {
                  ref.read(propertyListProvider.notifier).search(value);
                },
                onClear: () {
                  ref.read(propertyListProvider.notifier).search('');
                },
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _buildList(state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(PropertyListState state) {
    if (state.isLoading && state.properties.isEmpty) {
      return const HodiLoadingShimmer();
    }

    if (state.error != null && state.properties.isEmpty) {
      return HodiErrorState(
        message: state.error!,
        onRetry: () => ref.read(propertyListProvider.notifier).refresh(),
      );
    }

    if (state.properties.isEmpty) {
      return const HodiEmptyState(
        icon: Icons.apartment_outlined,
        title: 'No Properties Found',
        subtitle: 'Try adjusting your search',
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: state.properties.length + (state.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.properties.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: CircularProgressIndicator(color: HodiColors.primaryStart),
            ),
          );
        }
        final property = state.properties[index];
        return PropertyListItem(
          property: property,
          onTap: () => context.push('/properties/${property.id}'),
        );
      },
    );
  }
}
