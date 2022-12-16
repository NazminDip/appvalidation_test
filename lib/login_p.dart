import 'package:flutter/material.dart';

import 'bgimage_page.dart';
import 'register_page.dart';

//import 'bgimage_page.dart';

class LoginP extends StatefulWidget {
  const LoginP({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPState createState() => _LoginPState();
}

class _LoginPState extends State<LoginP> {
  // final usercontroller = TextEditingController();
  // final paawordcontroller = TextEditingController();
  String gmail = "";
  String password = "";
  bool isVisible = true;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BgImagePage(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Card(
                color: Colors.white.withOpacity(0.4),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formkey,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text(
                                "Gmail",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                              suffix: Icon(Icons.mail, color: Colors.white),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your Gmail ";
                              } else if (!value.contains("@")) {
                                return 'Gmail is Incorrect';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              gmail = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              obscureText: isVisible ? true : false,
                              decoration: InputDecoration(
                                label: const Text(
                                  "Password",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold),
                                ),
                                suffix: IconButton(
                                  color: Colors.white,
                                  icon: isVisible
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(
                                      () {
                                        isVisible = !isVisible;
                                      },
                                    );
                                  },
                                ),
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Enter Your Password";
                                } else if (value.length <= 5) {
                                  return "Password must six character";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                password = newValue!;
                              }),
                        ),
                        const SizedBox(height: 15),
                        /////////////////////////////////////////////BUTTON
                        SizedBox(
                          width: 300,
                          height: 50,
                          child: FloatingActionButton.extended(
                              onPressed: () {
                                logInButton();
                              },
                              label: const Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                              )),
                        ),

                        const SizedBox(height: 15),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text("Register",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  logInButton() {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      formkey.currentState!.save();
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Your Gmail or Password Is Incorrect",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.purpleAccent,
      ));
    } else if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Your Login Is Success",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.purpleAccent,
      ));
      return Navigator.pushNamed(context, "/login");
    }
  }
}
