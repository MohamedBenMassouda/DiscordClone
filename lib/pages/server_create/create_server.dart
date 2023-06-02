import 'package:discord_clone/pages/server_create/server_purpose.dart';
import 'package:discord_clone/utils/server_option.dart';
import 'package:flutter/material.dart';

class CreateServer extends StatelessWidget {
  const CreateServer({super.key});

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ServerPurpose()));
    }

    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Column(
          children: [
            const Text(
              'Create Your Server',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            const Text("Your server is where you and your friends hang out.",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                )),
            const Text("Make yours and start talking.",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                )),
            Option(
              icon: Icons.add,
              text: 'Create My Own',
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
