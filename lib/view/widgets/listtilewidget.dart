import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  VoidCallback? onTap;
  ListTileWidget({super.key, required this.icon, required this.title, this.onTap });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1,),
        InkWell(
          onTap: onTap,
          child: ListTile(
            leading: Icon(icon),
            title: Text(title),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),

      ],
    );
  }
}