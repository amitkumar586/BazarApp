import 'package:bazar/routes/route_name.dart';
import 'package:bazar/view/widgets/drawer/draweritems.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
 
  

  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer( 
      child:Container(
        color: const Color(0xffd1ad17),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Welcome Amit"),
                      const SizedBox(height: 7,),
                      SizedBox(
                        height: 30,
                        child: OutlinedButton(onPressed: (){},
                         style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              width: 2
                            )
                          ),
                          ),
                         ),
                         child: const Text("Login"),
                         
                         ),
                      ),
                    ],
                  )
                ],
              ),
              ),
              DrawerListItems(title: 'Home',icons: const Icon(Icons.home,size: 30,color: Colors.black45,),),
              DrawerListItems(title: 'Rivew Cart',icons: const Icon(Icons.shop_outlined,size: 30,color: Colors.black45,),
              ontap: (){
                Navigator.pushNamed(context, RouteName.cartreviewscreen);
              },
              ),

              DrawerListItems(title: 'My Profile',icons: const Icon(Icons.person_outline,size: 30,color: Colors.black45,),
              ontap: (){
                Navigator.pushNamed(context, RouteName.myProfile);
              },
              ),

              DrawerListItems(title: 'Notification',icons: const Icon(Icons.notifications_outlined,size: 30,color: Colors.black45,),),
              DrawerListItems(title: 'Rating & Review',icons: const Icon(Icons.star_outline,size: 30,color: Colors.black45,),),
              DrawerListItems(title: 'Wishlist',icons: const Icon(Icons.favorite_outline,size: 30,color: Colors.black45,),),
              DrawerListItems(title: 'Raising & Complaint',icons: const Icon(Icons.copy,size: 30,color: Colors.black45,),),
              DrawerListItems(title: 'FAQs',icons: const Icon(Icons.format_quote,size: 30,color: Colors.black45,),),  
              
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: SizedBox(
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Contacty Support',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('Call us  :',style: TextStyle(fontSize:15) ),
                          SizedBox(width: 15,),
                          Text('8859658041',style: TextStyle(fontWeight: FontWeight.bold)),
                        ],      
                      ),
                      Row(
                        children: [
                        
                          Text('Mail us  :',style: TextStyle(fontSize:15)),
                          SizedBox(width: 15,),
                          Text('agangwar937@gmail.com',style: TextStyle(fontWeight: FontWeight.bold)),
                        ],      
                      ),
              
                    ],
                  ),
                ),
              ),
              

          ],
          
            
          ),
      ),
      );
  }
}