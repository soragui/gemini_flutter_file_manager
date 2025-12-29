import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:find/src/home/home_view_model.dart';
import 'package:find/src/home/widgets/file_grid_item.dart';

class FileGridView extends StatelessWidget {
  const FileGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    if (viewModel.isLoading && viewModel.displayedEntities.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.displayedEntities.isEmpty) {
      return const Center(child: Text('This folder is empty.'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: viewModel.displayedEntities.length,
      itemBuilder: (context, index) {
        final entity = viewModel.displayedEntities[index];
        return FileGridItem(entity: entity);
      },
    );
  }
}
