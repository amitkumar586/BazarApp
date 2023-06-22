import 'package:bazar/providers/countProvider.dart';
import 'package:bazar/providers/product_provider.dart';
import 'package:bazar/providers/review_cart_provider.dart';
import 'package:bazar/providers/user_provider.dart';
import 'package:bazar/routes/route_name.dart';
import 'package:bazar/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider<ProductProvider>(
    // create: (_) =>ProductProvider(),
    return MultiProvider(
      providers: [

    ChangeNotifierProvider<ProductProvider>(
    create: (_) =>ProductProvider(),
        ),

    ChangeNotifierProvider<UsertProvider>(
    create: (_) =>UsertProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => CountProvider() ,
          ),

          ChangeNotifierProvider<ReviewCartProvider>(
          create: (_) => ReviewCartProvider() ,
          ), 
      ]  ,
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
    //  home: const ProductHomePage(),
     initialRoute: RouteName.splashscreen,
     onGenerateRoute: Routes.generateRoute,
    )
      );
  }
}

