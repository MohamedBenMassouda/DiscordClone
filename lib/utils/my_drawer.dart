import 'package:discord_clone/pages/server_create/create_server.dart';
import 'package:discord_clone/utils/discord_style_button.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120.0,
            child: DrawerHeader(
              padding: const EdgeInsets.all(0.0),
              child: MyIconButton(
                icon: const Icon(
                  Icons.messenger,
                ),
                onPressed: () {},
              ),
            ),
          ),
          MyIconButton(
            icon: const Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateServer()));
            },
          ),
        ],
      ),
    );
  }
}
