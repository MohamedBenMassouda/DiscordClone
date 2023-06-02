import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const Option({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.black38,
          ),
          height: 55,
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
