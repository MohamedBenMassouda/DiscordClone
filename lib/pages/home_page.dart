import 'package:discord_clone/pages/login_page.dart';
import 'package:discord_clone/utils/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discord Clone'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage()
                )
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            scaffoldKey.currentState?.openDrawer();
          }
        },
        child: const Center(
          child: Text(
            'Hello, world!',
          ),
        ),
      ),
    );
  }
}
