import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:find/src/home/home_view_model.dart';
import 'package:find/src/home/widgets/sidebar.dart';
import 'package:find/src/home/widgets/header_bar.dart';
import 'package:find/src/home/widgets/file_list_view.dart';
import 'package:find/src/home/widgets/status_bar.dart';

class ToggleHiddenFilesIntent extends Intent {}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      autofocus: true,
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyH):
            ToggleHiddenFilesIntent(),
      },
      actions: {
        ToggleHiddenFilesIntent: CallbackAction<ToggleHiddenFilesIntent>(
          onInvoke: (intent) =>
              context.read<HomeViewModel>().toggleShowHiddenFiles(),
        ),
      },
      child: Scaffold(
        body: Column(
          children: [
            const HeaderBar(),
            Expanded(
              child: Row(
                children: [
                  const Sidebar(),
                  const VerticalDivider(width: 1),
                  Expanded(child: const FileListView()),
                ],
              ),
            ),
            const StatusBar(),
          ],
        ),
      ),
    );
  }
}
