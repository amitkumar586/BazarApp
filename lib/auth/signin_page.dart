import 'package:bazar/routes/route_name.dart';
import 'package:bazar/utilities/buttons/login_logout_button.dart';
import 'package:bazar/utilities/toastMessages/toaster.dart';
import 'package:bazar/view/widgets/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  State<SignInPage> createState() => _SignInPageState();
}
class _SignInPageState extends State<SignInPage> {
  bool loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  
   @override
  void dispose() {
    super.dispose();
  
    
    emailController.dispose();
    passwordController.dispose();
  }

  void login(){
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
    email: emailController.text, 
    password: passwordController.text
    
    ).then((value){

      MyToasterMessage().toastMessage(value.user!.email.toString());
      Navigator.pushNamed(context,RouteName.homePage);
      setState(() {
      loading = false;
    });

    }).onError((error, stackTrace){
      debugPrint(error.toString());
      MyToasterMessage().toastMessage(error.toString());
      setState(() {
      loading = false;
    });
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              width: double.infinity,
              // color:Colors.red,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .01),
                  const Text(
                    "Sign in to continue",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .01),
                  Text(
                    'Vegitables',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.green.shade900,
                          spreadRadius: 2.0,
                          offset: const Offset(3, 3),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * .001),
                          Mytextformfields(
                              hintText: "Enter your email",
                              icons: const Icon(Icons.email_outlined),
                              mycontroller: emailController,
                              errorTxt: 'Enter email'),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * .035),
                          Mytextformfields(
                              hintText: "Enter your password",
                              icons: const Icon(Icons.lock),
                              mycontroller: passwordController,
                              errorTxt: 'Enter password'),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .03),
                          LoginLogoutButton(
                            title: 'Sign In',
                            loading: loading,
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                login();
                              }
                              MyToasterMessage().toastMessage('Error');
                            },
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .001),

                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                 Text(
                                      "Don't have an account?",
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, RouteName.signupPage);
                          }, 
                          child: const Text("Sign up"),
                          ),
                            ],
                           ),

                          Text(
                            'By signing in you are agreeing to our',
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                          Text(
                            'Terms & Privacy Policy',
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ],
                      ),
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
