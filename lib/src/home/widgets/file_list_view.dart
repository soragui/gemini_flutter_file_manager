import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:find/src/home/home_view_model.dart';
import 'package:find/src/home/widgets/file_item.dart';

class FileListView extends StatelessWidget {
  const FileListView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    if (viewModel.isLoading && viewModel.displayedEntities.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.displayedEntities.isEmpty) {
      return const Center(child: Text('This folder is empty.'));
    }

    return ListView.builder(
      itemCount: viewModel.displayedEntities.length,
      itemBuilder: (context, index) {
        final entity = viewModel.displayedEntities[index];
        return FileItem(entity: entity);
      },
    );
  }
}
