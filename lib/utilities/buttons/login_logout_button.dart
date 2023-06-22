// ignore_for_file: must_be_immutable

import 'package:bazar/utilities/circularIndicator/circular_indicator.dart';
import 'package:flutter/material.dart';

class LoginLogoutButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  bool loading;
  LoginLogoutButton({super.key, required this.title, required this.onTap, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .055,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 76, 175, 80),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: loading? const Loading() : Text(title,style: const TextStyle(color: Colors.white,fontSize: 20),),
      ),
    ) ;
  }
}