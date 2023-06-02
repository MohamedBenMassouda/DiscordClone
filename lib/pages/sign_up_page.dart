// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discord_clone/pages/home_page.dart';
import 'package:discord_clone/services/auth_manager.dart';
import 'package:discord_clone/utils/functions/my_snack_bar.dart';
import 'package:discord_clone/utils/my_text_field.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatelessWidget {
  SingUpPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController profilePicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List items = [
      [usernameController, "Username", false],
      [emailController, "Email", false],
      [passwordController, "Password", true],
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            const Text(
              "Welcome to Discord Clone",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 40.0),
            for (var item in items)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: MyTextField(
                  controller: item[0],
                  hintText: item[1],
                  obscureText: item[2],
                ),
              ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.trim() == "" ||
                    passwordController.text.trim() == "" ||
                    usernameController.text.trim() == "") {
                  mySnackBar(context, "Please fill all the fields");
                  return;
                } else if (!emailController.text.contains("@")) {
                  mySnackBar(context, "Please enter a valid email");
                  return;
                } else if (passwordController.text.trim().length < 8) {
                  mySnackBar(context, "Password must be at least 8 characters");
                  return;
                }

                FirebaseFirestore.instance
                    .collection("users")
                    .get()
                    .then((value) {
                  for (var user in value.docs) {
                    if (user.data()["displayName"] == usernameController.text) {
                      mySnackBar(context, "Username already exists");
                      return;
                    } else if (user.data()["email"] == emailController.text) {
                      mySnackBar(context, "Email already exists");
                      return;
                    }
                  }
                });

                AuthManager.registerWithEmailAndPassword(
                  emailController.text,
                  passwordController.text,
                  usernameController.text,
                ).then((value) {
                  if (value == null) {
                    mySnackBar(context, "Failed to register");
                  } else {
                    mySnackBar(context, "Successfully registered");

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                });
              },
              child: const Text("Sign Up"),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  // Making a line divider on the right
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  // Making a line divider on the left
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
