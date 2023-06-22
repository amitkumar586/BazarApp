import 'package:bazar/product_overview/product_overview_page.dart';
import 'package:bazar/providers/product_provider.dart';
import 'package:bazar/view/home_screen/banner.dart';
import 'package:bazar/view/home_screen/product_display.dart';
import 'package:bazar/view/widgets/drawer/mydrawer.dart';
import 'package:bazar/view/widgets/search/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {

  late ProductProvider? productProvider;

   @override
  void initState() {
 ProductProvider productProvider = Provider.of(context,listen: false);
       productProvider.fetchVegitablesData();
       productProvider.fetchFruitsProductData();
       productProvider.fetchflowerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
 productProvider = Provider.of<ProductProvider>(context,);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffcbcbcb),
      drawer: const MyDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 17, color: Colors.black),
        ),
        backgroundColor: const Color(0xffd6b738),
        actions: [
          CircleAvatar(
              backgroundColor: const Color(0xffd4d181),
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MySingleSearch(
                    search: productProvider!.getAllProductsList,
                  )));
                  // Navigator.pushNamed(
                  //     context, RouteName.singleSearchItemScreen);
                },
                icon: const Icon(
                  Icons.search,
                  size: 17,
                  color: Colors.black,
                ),
              ),),
          // ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Color(0xffd4d181),
              child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            const MyBanner(),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Vegitables',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: (){

                            // Navigator.pushNamed(context, RouteName.singleSearchItemScreen);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MySingleSearch(
                              search: productProvider!.getvegitableProductList,
                            ),
                            ),
                            );
                          } ,
                          child: const Text(
                            'View all',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: productProvider!.getvegitableProductList.
                      map(
                        (data){
                          return ProductDisplay(
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => ProductOverViewPage(
                                      productName: data.productName.toString(),
                                      productImage: data.productImage.toString(),
                                      productPrice: data.productPrice,
                                          ),
                                ),
                                );
                          },
                          productId: data.productId,
                          imageurl:data.productImage.toString(),
                          productName: data.productName.toString(),
                          units: 'kg',
                          price: data.productPrice,
                        );
                        }).toList(),  
                       
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Fresh Fruits',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MySingleSearch(
                                search: productProvider!.getfruitsProductList,
                              ),
                              ));
                          },
                          child: const Text(
                            'View all',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: productProvider!.getfruitsProductList.
                      map(
                        (data){
                          return ProductDisplay(
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => ProductOverViewPage(
                                      productName: data.productName.toString(),
                                      productImage: data.productImage.toString(),
                                      productPrice: data.productPrice,
                                          ),
                                ),
                                );
                          },
                          productId: data.productId,
                          imageurl:data.productImage.toString(),
                          productName: data.productName.toString(),
                          units: 'kg',
                          price: data.productPrice,
                        );
                        }).toList(),
                      
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Fresh Flowers',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                         InkWell(
                          onTap: (){

                            // Navigator.pushNamed(context, RouteName.singleSearchItemScreen);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MySingleSearch(
                              search: productProvider!.getflowerProductList,
                            ),
                            ),
                            );
                          } ,
                          child: const Text(
                            'View all',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: productProvider!.getflowerProductList.
                      map(
                        (data){
                          return ProductDisplay(
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => ProductOverViewPage(
                                      productName: data.productName.toString(),
                                      productImage: data.productImage.toString(),
                                      productPrice: data.productPrice,
                                          ),
                                ),
                                );
                          },
                          productId: data.productId,
                          imageurl:data.productImage.toString(),
                          productName: data.productName.toString(),
                          units: 'kg',
                          price: data.productPrice,
                        );
                        }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
