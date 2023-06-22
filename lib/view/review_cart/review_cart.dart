import 'package:bazar/models/reviewcart_model.dart';
import 'package:bazar/providers/review_cart_provider.dart';
import 'package:bazar/view/widgets/search/single_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context); 
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar:ListTile(
        title: const Text("Total Amount"),
        subtitle: Text("\$ 200.00",style: TextStyle(color: Colors.green[900]),),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(onPressed: (){},
          
          color: Colors.yellow,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Text("Submit"),
          ),
        ),
      ) ,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black,),
        backgroundColor: Colors.yellow,
        title: const Text("Review Cart",style: TextStyle(color: Colors.black,fontSize: 18),),
    ),
    body:ListView.builder(
      shrinkWrap: true,
      itemCount: reviewCartProvider.ReviewCartDataList.length ,

      itemBuilder: (context, index) {
       ReviewCartModel data = reviewCartProvider.ReviewCartDataList[index];

      return Column(
        children: [
        const SizedBox(height: 10,),
        SingleItem(isbool:true,productImage:data.cartImage,  productName:data.cartName, productPrice: data.cartPrice, productId: data.cartId!, productQuantity: data.cartQuantity, ),
        // SingleItem(isbool:true,productImage:"",  productName: '', productPrice: 1, ),
        const SizedBox(height: 10,),

        ],
      );
    },
      
      // children: [
      
      //   // SingleItem(isbool:true, producImage: '', productName: '', productPrice: '',),
      //   // SingleItem(),
      //   // SingleItem(),
      //   // SingleItem(),
      //   // SingleItem(),
        
        
      // ],
    ) ,
    );
  }
}