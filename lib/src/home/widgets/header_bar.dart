import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import 'package:find/src/home/home_view_model.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Ionicons.arrow_back),
            onPressed: () => viewModel.navigateBack(),
          ),
          IconButton(
            icon: const Icon(Ionicons.arrow_forward),
            onPressed: () {
              // Forward navigation logic will be implemented later
            },
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              viewModel.currentPath,
              style: Theme.of(context).textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Ionicons.list_outline),
            isSelected: viewModel.viewType == FileViewType.list,
            onPressed: () => viewModel.setViewType(FileViewType.list),
          ),
          IconButton(
            icon: const Icon(Ionicons.grid_outline),
            isSelected: viewModel.viewType == FileViewType.grid,
            onPressed: () => viewModel.setViewType(FileViewType.grid),
          ),
        ],
      ),
    );
  }
}
