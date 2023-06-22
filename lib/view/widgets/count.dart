// ignore_for_file: must_be_immutable

import 'package:bazar/providers/review_cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCount extends StatefulWidget {

   String? productName;
   String? productImage;
   String? produtId;
   int? productPrice;
  
   MyCount({super.key, required this.productName, required this.productImage, required this.produtId, required this.productPrice});

  @override
  State<MyCount> createState() => _MyCountState();
}
class _MyCountState extends State<MyCount> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    final reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
        //  color:Colors.red,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue == true ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              if(count > 1){
                setState(() {
                count--;
              });
              }if(count == 1){
                setState(() {
                  isTrue = false;
                });
              }          
            },
            child: const Icon(
              Icons.remove,
              size: 15,
              color: Color(0xffd0b84c),
            ),
          ),
          Text(
            '$count',
            style: const TextStyle(
              color: Color(0xffd0b84c),
            ),
          ),
          
          InkWell(
            onTap: (){
              setState(() {
                count++;
              });
            },
            child: const Icon(
              Icons.add,
              size: 15,
              color: Color(0xffd0b84c),
            ),
          ),
        ],
      ): Center(
        child: InkWell(
          onTap: (){
            setState(() {
              isTrue = true;
            });
             reviewCartProvider.addReviewCartData(
              cartId: widget.produtId,
              cartImage: widget.productImage,
              cartName: widget.productName,
              cartQuantity: count,
              cartPrice: widget.productPrice,
            );
          },
          child: const Text("ADD",style: TextStyle(
            color: Colors.black,
          ),
          ),
        ),
      )
    );
  }
}
