import 'package:flutter/material.dart';
class DrawerListItems extends StatelessWidget {
  var icons;
  final String title; 
  VoidCallback?ontap;
  
  DrawerListItems({super.key , this.icons, required this.title, this.ontap });

  @override
  Widget build(BuildContext context) {
    return ListTile( 
        onTap: ontap,
        leading: icons,
        title: Text(title,style:const TextStyle(
          color: Colors.black45
        ) ,),
        );
  }
}