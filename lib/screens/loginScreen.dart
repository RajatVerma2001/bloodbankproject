import 'package:bloodbankproject/services/routing.dart';
import "package:flutter/material.dart";
import '../common_widgets/pageLayoutWidgets.dart';
import '../common_widgets/common_widgets.dart';
import "package:firebase_auth/firebase_auth.dart";

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSignInForm = true;

  Future<void> signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushNamedAndRemoveUntil(
          context, homeScreenID, (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: Text("ALERT"),
              content: Text("INVALID CREDENTIALS!!"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Try Again",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(priColor)),
                )
              ],
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: Text("CONGRATS"),
              content: Text("Registered Successfully!!"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    signIn();
                  },
                  child: Text(
                    "SignIn",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(priColor)),
                )
              ],
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secColor,
        actions: [
          TextButton(
            child: Icon(Icons.logout_rounded, color: Colors.white),
            onPressed: () async {
              try {
                await _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, loginScreenID, (route) => false);
              } on FirebaseAuthException catch (e) {
                print(e.code);
              } catch (e) {
                print(e.toString());
              }
            },
          ),
        ],
      ),
      backgroundColor: priColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 100,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Life Drop",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        "your blood can save lives",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        child: Center(
                          child: TextButton(
                            child: Text(
                              isSignInForm ? "Sign In" : "Register",
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFFECEBEB),
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    8,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (isSignInForm)
                                await signIn();
                              else
                                await signUp();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isSignInForm ? "New User?" : "Have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          isSignInForm ? "Register here" : "Login",
                          style: TextStyle(
                            color: Colors.yellowAccent,
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isSignInForm = !isSignInForm;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
