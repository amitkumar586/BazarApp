import 'package:bazar/auth/signin_page.dart';
import 'package:bazar/auth/signup_page.dart';
import 'package:bazar/product_overview/product_overview_page.dart';
import 'package:bazar/routes/route_name.dart';
import 'package:bazar/view/home_screen/product_home_page.dart';
import 'package:bazar/view/my_profile/my_profile.dart';
import 'package:bazar/view/review_cart/review_cart.dart';
import 'package:bazar/view/widgets/search/search.dart';
import 'package:bazar/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.signupPage:
      return MaterialPageRoute(builder: (BuildContext context)=> const SignUpPage());
      case RouteName.signinPage:
      return MaterialPageRoute(builder: (BuildContext context)=> const SignInPage());
      case RouteName.homePage:
      return MaterialPageRoute(builder: (BuildContext context)=> const ProductHomePage());
      case RouteName.productOverview:
      return MaterialPageRoute(builder: (BuildContext context)=> ProductOverViewPage(productImage:'', productName: ''));
      case RouteName.myProfile:
      return MaterialPageRoute(builder: (BuildContext context)=> const MyProfile());
      case RouteName.splashscreen:
      return MaterialPageRoute(builder: (BuildContext context)=> const SplashScreen());
      case RouteName.singleSearchItemScreen:
      return MaterialPageRoute(builder: (BuildContext context)=>  MySingleSearch());
      case RouteName.cartreviewscreen:
      return MaterialPageRoute(builder: (BuildContext context)=> const ReviewCart());
    
      default:  
      return MaterialPageRoute(builder:(_)=>const Scaffold(
        body: Center(
          child: Text("Invald Route"), 
        ),
      ));
    
    }
  }
} 