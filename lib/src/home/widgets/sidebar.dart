import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import 'package:find/src/home/home_view_model.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _SidebarItem(
            icon: Ionicons.time_outline,
            label: 'Recent',
            onTap: () {},
          ),
          _SidebarItem(
            icon: Ionicons.star_outline,
            label: 'Starred',
            onTap: () {},
          ),
          const SizedBox(height: 24),
          _SidebarItem(
            icon: Ionicons.home_outline,
            label: 'Home',
            onTap: () =>
                context.read<HomeViewModel>().navigateToHomeDirectory(),
            isSelected: true, // Example of a selected item
          ),
          _SidebarItem(
            icon: Ionicons.document_outline,
            label: 'Documents',
            onTap: () {},
          ),
          _SidebarItem(
            icon: Ionicons.download_outline,
            label: 'Downloads',
            onTap: () {},
          ),
          _SidebarItem(
            icon: Ionicons.desktop_outline,
            label: 'Desktop',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
      selected: isSelected,
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}
