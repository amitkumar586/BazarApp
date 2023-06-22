import 'package:flutter/material.dart';
class Mytextformfields extends StatelessWidget {
  
  final mycontroller;
  final String hintText;
  var icons;
  final String errorTxt;
   Mytextformfields(
    {super.key, 
    required this.hintText,
    required this.icons,
    required this.mycontroller,
    required this.errorTxt});
  @override
  Widget build(BuildContext context) {
    return TextFormField(    
      controller: mycontroller,
       decoration: InputDecoration(  
        prefixIcon: icons,      
        hintText: hintText,
       border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
       ),
        ),
        validator: (value){
          if(value!.isEmpty){
            return errorTxt;
          }else{
            return null;
          }          
        },
    );
  }
}