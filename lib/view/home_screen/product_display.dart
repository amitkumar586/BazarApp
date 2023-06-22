import 'package:bazar/view/widgets/count.dart';
import 'package:flutter/material.dart';
class ProductDisplay extends StatelessWidget {
  final String? productName;
  final int? price;
  final String? units;
  final String? imageurl;
  final VoidCallback? ontap;
  final String? productId;
  const ProductDisplay({
      super.key,
      required this.productName,
      required this.units,
      required this.imageurl,
      required this.price,
      required this.ontap,
      this.productId
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 232,
      width: 174,
      decoration: BoxDecoration(
        color: const Color(0xffd9dad9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: ontap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(imageurl!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName!,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text('$price\$/ 1 $units',
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 5),
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          //  color:Colors.blue,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Expanded(
                                child: Text(
                              '50 gram',
                              style: TextStyle(fontSize: 10),
                            )),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: MyCount(
                        produtId: productId,
                        productImage: imageurl,
                        productName: productName,
                        productPrice: price,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
