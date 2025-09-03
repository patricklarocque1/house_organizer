import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:house_organizer/data/models/list_model.dart';
import 'package:house_organizer/features/auth/providers/auth_providers.dart';
import 'package:house_organizer/features/lists/providers/list_providers.dart';
import 'package:house_organizer/features/lists/screens/create_list_screen.dart';
import 'package:house_organizer/features/lists/screens/list_detail_screen.dart';
import 'package:house_organizer/features/lists/widgets/list_card.dart';
import 'package:house_organizer/features/lists/widgets/list_filter_bottom_sheet.dart';

class ListOverviewScreen extends ConsumerStatefulWidget {
  const ListOverviewScreen({super.key});

  @override
  ConsumerState<ListOverviewScreen> createState() => _ListOverviewScreenState();
}

class _ListOverviewScreenState extends ConsumerState<ListOverviewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  ListTypeFilter _currentFilter = const ListTypeFilter();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists'),
        actions: [
          IconButton(
            onPressed: _showFilterBottomSheet,
            icon: const Icon(Icons.filter_list),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Grocery'),
            Tab(text: 'Errands'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search lists...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildListTab(null),
                _buildListTab(ListType.grocery),
                _buildListTab(ListType.errands),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CreateListScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListTab(ListType? type) {
    final filter = _currentFilter.copyWith(type: type);

    return Consumer(
      builder: (context, ref, child) {
        final authState = ref.watch(authNotifierProvider);

        return authState.when(
          data: (user) {
            if (user == null) {
              return const Center(child: Text('Please sign in to view lists'));
            }

            return _buildListContent(user.houseId, filter);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) =>
              Center(child: Text('Error: ${error.toString()}')),
        );
      },
    );
  }

  Widget _buildListContent(String houseId, ListTypeFilter filter) {
    final listsAsync = ref.watch(listsByTypeProvider(filter));

    return listsAsync.when(
      data: (lists) {
        // Apply search filter
        final filteredLists = _searchQuery.isEmpty
            ? lists
            : lists
                .where(
                  (list) =>
                      list.name.toLowerCase().contains(
                            _searchQuery.toLowerCase(),
                          ) ||
                      (list.description?.toLowerCase().contains(
                                _searchQuery.toLowerCase(),
                              ) ??
                          false),
                )
                .toList();

        if (filteredLists.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.list_alt, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  _searchQuery.isNotEmpty
                      ? 'No lists found'
                      : 'No ${filter.type?.displayName.toLowerCase() ?? ''} lists',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  _searchQuery.isNotEmpty
                      ? 'Try adjusting your search terms'
                      : 'Create your first list to get started',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(listsByTypeProvider(filter));
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filteredLists.length,
            itemBuilder: (context, index) {
              final list = filteredLists[index];
              return ListCard(
                list: list,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ListDetailScreen(listId: list.id),
                    ),
                  );
                },
                onDelete: () => _showDeleteConfirmation(list),
                onComplete: () => _completeList(list),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error loading lists',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(listsByTypeProvider(filter));
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ListFilterBottomSheet(
        currentFilter: _currentFilter,
        onFilterChanged: (filter) {
          setState(() {
            _currentFilter = filter;
          });
        },
      ),
    );
  }

  void _showDeleteConfirmation(ListModel list) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete List'),
        content: Text('Are you sure you want to delete "${list.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(listNotifierProvider.notifier).deleteList(list.id);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _completeList(ListModel list) {
    ref.read(listNotifierProvider.notifier).completeList(list.id);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('${list.name} marked as completed')));
  }
}
