import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import 'package:find/src/data/models/file_system_entity.dart';
import 'package:find/src/data/models/directory_entity.dart';
import 'package:find/src/home/home_view_model.dart';

class FileItem extends StatelessWidget {
  const FileItem({super.key, required this.entity});

  final FileSystemEntity entity;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final isSelected = viewModel.selectedEntities.contains(entity);

    return ListTile(
      leading: Icon(
        entity.isDirectory
            ? Ionicons.folder_outline
            : Ionicons.document_outline,
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(entity.name),
      selected: isSelected,
      onTap: () {
        if (entity is DirectoryEntity) {
          viewModel.navigateToDirectory(entity as DirectoryEntity);
        } else {
          viewModel.toggleSelection(entity);
        }
      },
      onLongPress: () {
        viewModel.toggleSelection(entity);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
