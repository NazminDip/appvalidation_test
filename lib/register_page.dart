// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

import 'bgimage_page.dart';
import 'login_p.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isVisible = true;
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Page")),
      body: Stack(fit: StackFit.expand, children: [
        const BgImagePage(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Card(
              color: Colors.white.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter Your Full Name",
                              hintStyle: TextStyle(color: Colors.white),
                              label: Text(
                                "Name",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: mailController,
                          validator: ((value) {
                            return mailValid(value);
                          }),
                          decoration: const InputDecoration(
                              hintText: "Enter Your Gmail",
                              hintStyle: TextStyle(color: Colors.white),
                              label: Text("Gmail",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: passController,
                          validator: ((value) {
                            return passValid(value);
                          }),
                          obscureText: isVisible ? true : false,
                          decoration: InputDecoration(
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
                              hintText: "Enter Your Password",
                              hintStyle: const TextStyle(color: Colors.white),
                              label: const Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ////////////////////////////////////// BUTTON
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: FloatingActionButton.extended(
                            onPressed: () {
                              regisButton();
                            },
                            backgroundColor: Colors.purple,
                            label: const Text(
                              "Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

//////////////////////////////////////////// Validation
  mailValid(var value) {
    if (value.isEmpty) {
      return 'Enter Your Gmail';
    } else if (!value.contains('@')) {
      return 'Your Gmail Is Ivalid';
    }
    return null;
  }

  passValid(var value) {
    if (value.isEmpty) {
      return 'Enter Your Password';
    } else if (value.length <= 5) {
      return 'Enter Password At least 6 Character';
    }
    return null;
  }

  regisButton() {
    final isvalid = formkey.currentState!.validate();
    if (!isvalid) {
      formkey.currentState!.save();
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Your Gmail Or Password Is Incorrect',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purpleAccent,
      ));
    }
    if (isvalid) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Your Register Is Success.Login Now',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purpleAccent,
      ));
      return Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginP()));
    }
    return null;
  }
}
