// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {

  bool isbool = false;
  final String? productImage;
  final String? productName;
  final int? productPrice;
  final String productId;
  final int? productQuantity;
  SingleItem({super.key, required this.isbool, required this.productImage, required this.productName, required this.productPrice, required this.productId, this.productQuantity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: Image.network(
                        productImage!),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 90,
                  child: Column(
                    children: [
                       Column(
                        mainAxisAlignment: isbool == false ? MainAxisAlignment.spaceAround: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            productName!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                             '$productPrice \$/ Gram',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      
                    isbool == false?  Container(
                        margin: const EdgeInsets.only(right: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 232, 230, 230),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Text(
                                "50 Gram",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ): const Text("50 Gram")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  padding: isbool == false? const EdgeInsets.symmetric(horizontal: 15, vertical: 32) : const EdgeInsets.only(left: 15,right: 15) ,
                  child: isbool == false ?
                   Container(
                    height: 25,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 235, 235),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ) : Column(
                    children: [
                      const Icon(Icons.delete , size: 30,color: Colors.black,),
                      const SizedBox(height: 5,),
                      Container(
                    height: 25,
                    width: 70,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 235, 235),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.grey,
                            size: 20,
                          ),
                          Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                    ],
                  ) ,
                ),
              ),
              
            ],
          ),
        ),
        isbool == false?Container():const Divider(
                height: 1,
                 color: Colors.black45,
              )
      ],
    );
  }
}
