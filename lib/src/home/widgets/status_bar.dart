import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:find/src/home/home_view_model.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final selectedCount = viewModel.selectedEntities.length;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            selectedCount > 0
                ? '$selectedCount item${selectedCount > 1 ? 's' : ''} selected'
                : '',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
