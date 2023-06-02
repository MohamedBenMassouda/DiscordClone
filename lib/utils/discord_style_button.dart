import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  const MyIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RawMaterialButton(
        constraints: const BoxConstraints(
          minWidth: 50.0,
          minHeight: 50.0,
        ),
        onPressed: onPressed,
        elevation: 2.0,
        fillColor: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(),
        child: icon,
      ),
    );
  }
}
