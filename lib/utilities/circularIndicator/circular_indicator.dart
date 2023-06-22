import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: 4,
      color: Colors.white,
    );
  }
}

// class Loading{

//   void  circularIndicator(){
    
//   }

// }