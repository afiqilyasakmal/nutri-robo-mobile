import 'package:nutrirobo/landingPage/page/signUp.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import '../../drawer.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Row(
            children: [
              Image.asset(
                'assets/logo.jpg',
                height: 70,
                width: 150,
              ),
            ],
          ),
        ),
        endDrawer: const MyDrawer(),
        body: ListView(children: [
          Container(
              margin: const EdgeInsets.only(top: 60, left: 25, right: 25),
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Form(
                  child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(38, 70, 85, 1)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50.0),
                    child: Divider(
                      color: Color.fromRGBO(38, 70, 85, 1), //color of divider
                      height: 1, //height spacing of divider
                      thickness: 2, //thickness of divier line
                      indent: 140, //spacing at the start of divider
                      endIndent: 140, //spacing at the end of divider
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        // Menambahkan icon agar lebih intuitif
                        icon: const Icon(Icons.people),
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Divider(
                      color: Color.fromRGBO(38, 70, 85, 1), //color of divider
                      height: 1, //height spacing of divider
                      thickness: 1, //thickness of divier line
                      indent: 25, //spacing at the start of divider
                      endIndent: 25, //spacing at the end of divider
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 20),
                    child: TextFormField(
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: "Password",
                        // Menambahkan icon agar lebih intuitif
                        icon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          splashRadius: 1,
                          icon: Icon(isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: togglePasswordView,
                        ),

                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40.0),
                    child: Divider(
                      color: Color.fromRGBO(38, 70, 85, 1), //color of divider
                      height: 1, //height spacing of divider
                      thickness: 1, //thickness of divier line
                      indent: 25, //spacing at the start of divider
                      endIndent: 25, //spacing at the end of divider
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 15, 81, 135)),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "Don't have account yet?",
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
        ]));
  }
}
