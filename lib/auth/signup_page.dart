import 'package:bazar/routes/route_name.dart';
import 'package:bazar/utilities/buttons/login_logout_button.dart';
import 'package:bazar/utilities/toastMessages/toaster.dart';
import 'package:bazar/view/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
  
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
              fit: BoxFit.cover),
        ),
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
                    "Sign up to continue",
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
                        
                            title: 'Sign Up',
                            loading: loading ,
                            onTap: () {

                              if (_formkey.currentState!.validate()) {

                                 setState(() {
                                loading = true;
                              });

                                _auth.createUserWithEmailAndPassword(
                                        email: emailController.text.toString(),
                                        password:
                                            passwordController.text.toString(),
                                            )
                                    .then((value) {

                                      Navigator.pushNamed(context, RouteName.signinPage);
                                    //  emailController.clear();
                                    //   passwordController.clear();

                                   setState(() {
                                loading = false;
                              });

                                    })
                                     .onError((error, stackTrace) {
                                  MyToasterMessage()

                                      .toastMessage("Please enter valid data");
                                          setState(() {
                                      loading = false;
                                      
                              });
                                });
                              }
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * .001),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteName.signinPage);
                                },
                                child: const Text("Sign In"),
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
