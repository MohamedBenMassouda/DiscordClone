import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  // Without the controller we can't access the what the user inputs
  final TextEditingController controller;
  // The hint the user sees before typing
  final String hintText;
  final bool obscureText;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  // Initializing the obscure text to true
  // That means we pretending it's a password
  // Later we will make sure what according to the widget.obscureText
  // Without it pressing the icon won't do anything
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    // If the obscureText is true => The input is a password
    // That means the user needs to toggle the password on and off to be able to read his input
    // If the obscureText is false => The input is a username
    _obscureText = widget.obscureText ? _obscureText : false;

    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black45 : Colors.grey[200],
          borderRadius: BorderRadius.circular(29),
        ),
        child: TextField(
          // controller holds the input of the user
          controller: widget.controller,
          // obscureText is true => The input is a password
          // else The input is a normal text
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            // If the obscureText is true => The input is a password and we need to show the icon accordingly
            // else it can be none because in that case we don't need an icon
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        // When pressed changing the value of obscureText
                        // If true => false otherwise false => true
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
