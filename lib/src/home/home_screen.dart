import 'package:flutter/material.dart';

import 'package:find/src/home/widgets/sidebar.dart';
import 'package:find/src/home/widgets/header_bar.dart';
import 'package:find/src/home/widgets/file_list_view.dart';
import 'package:find/src/home/widgets/status_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
