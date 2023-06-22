// ignore_for_file: must_be_immutable

import 'package:bazar/view/widgets/bottom_navigation/bottom_navigationbar.dart';
import 'package:flutter/material.dart';

enum SigninCharacter{fill , outlinr}

class ProductOverViewPage extends StatefulWidget {

final String productName;
final String productImage;
int? productPrice;
  
  ProductOverViewPage({super.key, required this.productName, required this.productImage, this.productPrice});

  @override
  State<ProductOverViewPage> createState() => _ProductOverViewPageState();
}

class _ProductOverViewPageState extends State<ProductOverViewPage> {
  
  SigninCharacter _character = SigninCharacter.fill;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:const Row(
        children: [
          MyBottomNavigationBar(title: "Add to wish list",
          color: Colors.white, 
          backgroundColor: Colors.black,
          iconColor: Colors.grey,
          iconData:Icons.favorite_outline ,
          textColor: Colors.white
          ),

          MyBottomNavigationBar(title: "Go to cart",
          color: Colors.white, 
          backgroundColor: Color(0xffd1ad17),
          iconColor: Colors.white70,
          iconData:Icons.shop_outlined ,
          textColor: Colors.white
          )
        ],
      )  ,
      appBar: AppBar(
        title: const Text("Product Overview",style: TextStyle(color: Colors.black),),
        iconTheme: const IconThemeData(color:Colors.black
         ),
    ),
    body:Column(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            width: double.infinity ,
            child: Column(
              children: [
                ListTile(
                  title: Text(widget.productName.toString()),
                  subtitle: const Text("\$50"),
                ),
                Container(
                  height: 250,
                  padding: const EdgeInsets.all(40),
                  child: Image(image: NetworkImage(widget.productImage.toString()))
                ),
                Container(

                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: const Text("Available options",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),textAlign:TextAlign.start ,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.green[700],
                          ),
                          Radio(
                            activeColor: Colors.green[700],
                            value: SigninCharacter.fill, groupValue: _character, onChanged: (value) {
                              setState(() {
                                _character = value!;
                              });
                              
                            }),     
                        ],
                      ),
                      const Text("\$50"),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_outlined,
                            size: 15,
                            color: Colors.green,),
                            Text("ADD",style:  TextStyle(
                              color: Colors.green
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ),
              ],
            ),
          ),
          )
        ,
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About this prodct",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                 SizedBox(height: 10,),
                 
                   Text(
                  "Frost free refrigerator: Auto defrost function to prevent ice-build up for small families and bachelors I freezer capacity: 61 L, fresh food capacity: 181 L ",
                    style: TextStyle(
                    fontSize: 17,
                    
                    fontWeight: FontWeight.w400,
                  ),
                ),

              ],
            ),
          )),
      ],
    ) ,
    );
  }
}