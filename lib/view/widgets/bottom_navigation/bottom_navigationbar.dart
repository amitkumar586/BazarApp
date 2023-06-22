import 'package:flutter/material.dart';
class MyBottomNavigationBar extends StatelessWidget {

  final Color color;
  final Color backgroundColor;
  final Color iconColor;
  final String title;
  final IconData iconData;
  final Color textColor;

  const MyBottomNavigationBar({super.key, required this.title, required this.color, required this.backgroundColor, required this.iconColor, required this.iconData, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(iconData,size: 17,
            color: iconColor),
            const SizedBox(width: 5,),
            Text(title,style: TextStyle(color: textColor,
            fontSize: 17),)

          ],
        ),

      )
       );
  }
}