import 'dart:async';
import 'package:bazar/providers/user_provider.dart';
import 'package:bazar/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashService{

  UsertProvider? usertProvider;

  void isLogin(BuildContext context){

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if(user != null){
        Timer(const Duration(seconds: 3), () { 
      Navigator.pushNamed(context, RouteName.homePage);
    });
    }else{
        Timer(const Duration(seconds: 3), () { 
      Navigator.pushNamed(context, RouteName.signinPage);
    });
    }
  }
}