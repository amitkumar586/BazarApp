import 'package:bazar/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier{

   late ProductModel productModel;

    List<ProductModel>search = [];

   productModels(QueryDocumentSnapshot element){

   productModel = productModel = ProductModel(
          productImage: element.get("productImage"),
          productName: element.get("productName"),
          productPrice:element.get("productPrice"),
          productId:element.get("productId")  
        );
        search.add(productModel);

   }
   
  ///////////////////////////////////////////////////////////
  
  List<ProductModel> vegitableProductList = [];

  fetchVegitablesData() async{
     List<ProductModel> newList = [];

      QuerySnapshot val =  await FirebaseFirestore.instance.collection("VegitableProducts").get();
      
      for (var element in val.docs) {
      productModels(element);
        newList.add(productModel);
         }   
     vegitableProductList = newList;
     notifyListeners();         
  }

  List<ProductModel> get getvegitableProductList{
    return vegitableProductList;
 }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  List<ProductModel> fruitsProductList = [];
 
  

  fetchFruitsProductData() async{
     List<ProductModel> newList = [];

      QuerySnapshot val  =  await FirebaseFirestore.instance.collection("freshfruits").get();
      
      for (var element in val.docs) {
      productModels(element);
        newList.add(productModel);
         }
     
     fruitsProductList = newList;
     notifyListeners();         
  }

  List<ProductModel> get getfruitsProductList{
    return fruitsProductList;
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  List<ProductModel> flowerProductList = [];

  fetchflowerData() async{
     List<ProductModel> newList = [];

      QuerySnapshot val =  await FirebaseFirestore.instance.collection("flowers").get();
      
      for (var element in val.docs) {
      productModels(element);
        newList.add(productModel);
         }
        
     flowerProductList = newList;
     notifyListeners();         
  }
  List<ProductModel> get getflowerProductList{
    return flowerProductList;
  }

  //////////////////////////////////////////////////
  
  List<ProductModel> get getAllProductsList{
    return search;
  }
  
}
