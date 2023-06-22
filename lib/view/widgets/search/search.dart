import 'package:bazar/models/product_model.dart';
import 'package:bazar/view/widgets/search/single_item.dart';
import 'package:flutter/material.dart';

class MySingleSearch extends StatefulWidget {

  List<ProductModel>? search =[];
  MySingleSearch({super.key, this.search});

  @override
  State<MySingleSearch> createState() => _MySingleSearchState();
}

class _MySingleSearchState extends State<MySingleSearch> {
  
  String query="";

  // coade for search items into list
   searchItems(String query){
    List<ProductModel> searcItem = widget.search!.where((element){
      return element.productName!.toLowerCase().contains(query);
    }).toList();
    return searcItem;
   }

  @override
  Widget build(BuildContext context) {

    List<ProductModel> searchProducts = searchItems(query);

    return Scaffold(
      
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.yellow,
        title: const Text("Search",style: TextStyle(
          color: Colors.black
        ),
        ),
        actions: const [
          Icon(Icons.menu_rounded),
        ],
      ),
  
    body: ListView(
      
      children: [
        const ListTile(
          title: Text("Items"),
        ),
        Container(
          height: 52,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child:TextFormField(
           
            onChanged:(value) {
              print(value);
              setState(() {
                query = value;
              });
            }, 

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              fillColor: const Color.fromARGB(255, 224, 223, 223),
              filled: true,
              hintText: "Search for item in this store",
              suffixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Column(
          children: searchProducts.
          map((data){
          return SingleItem(isbool:false, productName: data.productName , productPrice: data.productPrice, productImage: data.productImage, productId: '',);
          }).toList(),
        ),
      ],
    ),
    );
  }
}