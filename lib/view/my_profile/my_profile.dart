import 'package:bazar/routes/route_name.dart';
import 'package:bazar/utilities/toastMessages/toaster.dart';
import 'package:bazar/view/widgets/drawer/mydrawer.dart';
import 'package:bazar/view/widgets/listtilewidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
 
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("MY Profile",style: TextStyle(fontSize: 18,color: Colors.white),),
        backgroundColor: Colors.yellow,
      ),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.yellow
                ),
              ),

              Container(
                height: 548,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical:10),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)),
                
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // color: Colors.red,
                          width: 150,
                          height: 80,
                          padding: const EdgeInsets.only(left: 20),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Amit Kumar gangwar",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                               Text("agangwar189@gmail.com",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              ),

                            ],
                            ),
                           CircleAvatar(
                            radius: 15,
                            backgroundColor:Colors.yellow,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.edit,color: Colors.yellow,
                              ),
                            ),
                           ), 
                          ],
                        ),
                      ],
                    ),
                    ListTileWidget(icon:Icons.shop , title: 'My Order',),
                    ListTileWidget(icon:Icons.location_on_outlined , title: 'My Delivery Address',),
                    ListTileWidget(icon:Icons.person_outline , title: 'Refer A Friends',),
                    ListTileWidget(icon:Icons.file_copy_outlined , title: 'Terms & Condition',),
                    ListTileWidget(icon:Icons.policy_outlined , title: 'Privecyt Policy',),
                    ListTileWidget(icon:Icons.add_chart_outlined , title: 'About',),
                    ListTileWidget(icon:Icons.exit_to_app_outlined , title: 'Logout',onTap: () {
                     auth.signOut().then((value){
                       Navigator.pushNamed(context, RouteName.signinPage).onError((error, stackTrace){
                        MyToasterMessage().toastMessage(error.toString());
                        return null;
                       });
                     });
                    },),
                  ],
                ),
              ),

            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40,left: 30),
            child: CircleAvatar(
              radius: 50 ,
              backgroundColor: Colors.yellow,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage('https://png.pngtree.com/template/20190810/ourmid/pngtree-fresh-green-leaf-vegetable-logo-symbol-icon-image_292203.jpg'),
                backgroundColor: Colors.amber,
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}