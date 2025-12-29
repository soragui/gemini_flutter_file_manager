import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import 'package:find/src/data/models/file_system_entity.dart';
import 'package:find/src/data/models/directory_entity.dart';
import 'package:find/src/home/home_view_model.dart';

class FileGridItem extends StatelessWidget {
  const FileGridItem({super.key, required this.entity});

  final FileSystemEntity entity;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final isSelected = viewModel.selectedEntities.contains(entity);

    return InkWell(
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
      child: Card(
        color: isSelected
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                entity.isDirectory
                    ? Ionicons.folder_outline
                    : Ionicons.document_outline,
                size: 48,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(height: 8),
              Text(
                entity.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
