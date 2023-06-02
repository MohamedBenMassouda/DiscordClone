// ignore_for_file: must_be_immutable

import 'package:discord_clone/pages/home_page.dart';
import 'package:discord_clone/pages/sign_up_page.dart';
import 'package:discord_clone/services/auth_manager.dart';
import 'package:discord_clone/utils/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 50.0),

          const Text(
            "Welcome Back to",
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),

          const Text(
            "Discord Clone",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10.0),

          const Text(
            "Your place to talk, video chat, and hang out with friends and communities.",
            style: TextStyle(
              fontSize: 11.0,
              color: Colors.grey,
            ),
          ),

          const SizedBox(
            height: 60,
          ),

          MyTextField(
            controller: emailController,
            hintText: "Email",
          ),

          const SizedBox(height: 10.0),

          MyTextField(
            controller: passwordController,
            hintText: "Password",
            obscureText: true,
          ),

          const SizedBox(height: 10.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  AuthManager.signInWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  ).then((value) {
                    if (value != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
                  });
                },
                child: const Text("Login"),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingUpPage(),
                    ),
                  );
                },
                child: const Text("Register"),
              ),
            ],
          ),

          const SizedBox(height: 10.0),

          const Text(
            "Forgot your password?",
            style: TextStyle(
              fontSize: 11.0,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 30.0),

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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  AuthManager.signInWithGoogle().then((value) {
                    if (value != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
                  });
                },
                child: Image.network(
                  "http://pngimg.com/uploads/google/google_PNG19635.png",
                  fit: BoxFit.cover,
                  height: 40.0,
                  width: 40.0,
                ),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {},
                child: const Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ],
          ),

          const Spacer(),

          // const Text(
          //   "By registering, you agree to Discord's Terms of Service and Privacy Policy.",
          //   style: TextStyle(
          //     fontSize: 11.0,
          //     color: Colors.grey,
          //   ),
          // ),
        ],
      ),
    );
  }
}
