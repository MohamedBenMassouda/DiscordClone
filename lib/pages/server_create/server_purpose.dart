import 'package:discord_clone/pages/server_create/server_creation.dart';
import 'package:discord_clone/utils/server_option.dart';
import 'package:flutter/material.dart';

class ServerPurpose extends StatelessWidget {
  const ServerPurpose({super.key});

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ServerLastTouch()));
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            "Tell us more about your server",
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),

          const Text(
            "Give your new server a personality with a name and an icon.",
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.grey,
            ),
          ),

          const Text(
            "You can always change it later.",
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.grey,
            ),
          ),

          Option(
            icon: Icons.people,
            text: 'For me and my friends',
            onTap: onTap,
          ),

          Option(
            icon: Icons.public,
            text: 'For a club or community',
            onTap: onTap,
          ),
        ],
      )
    );
  }
}