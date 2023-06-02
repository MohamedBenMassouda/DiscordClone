// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ServerLastTouch extends StatelessWidget {
  ServerLastTouch({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Create Your Server",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            const Text("Your server is where you and your friends hang out.",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                )
            ),
            const Text("Make yours and start talking.",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                )
            ),
      
            // Upload Image
            
            
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Server Name",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                )
              )
            ),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
