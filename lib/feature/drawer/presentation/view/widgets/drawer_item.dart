import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management/shared/widgets/main_text.dart';

import '../../cubit/drawer_cubit.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.right,
      ),
      onTap: onTap,
    );
  }
}

class DrawerExpandedItem extends StatelessWidget {
  const DrawerExpandedItem({
    super.key,
    required this.itemKey,
    required this.icon,
    required this.title,
    required this.isExpanded,
    required this.subItems,
  });

  final String itemKey;
  final IconData icon;
  final String title;
  final bool isExpanded;
  final List<SubItemModel> subItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.right,
          ),
          trailing: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          onTap: () {
            context.read<DrawerCubit>().toggleExpansion(itemKey);
          },
        ),
        if (isExpanded)
          Container(
            color: const Color(0xFF1A252F),
            child: Column(
              children:
                  subItems.map((subItem) {
                    return ListTile(
                      leading: Icon(subItem.icon, color: Colors.white),
                      contentPadding: const EdgeInsets.only(
                        right: 32,
                        left: 16,
                      ),
                      title: MainText(
                        subItem.title,
                        color: Colors.white70,
                        fontSize: 14,
                        textAlign: TextAlign.right,
                      ),
                      onTap: subItem.onTap,
                    );
                  }).toList(),
            ),
          ),
      ],
    );
  }
}

class SubItemModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  SubItemModel({required this.title, required this.icon, required this.onTap,});
}
