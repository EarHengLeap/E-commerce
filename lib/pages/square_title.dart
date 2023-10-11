import 'package:flutter/material.dart';

class SquareTitle extends StatelessWidget {
  final Function()? onTap;
  final String imagePath;

  const SquareTitle({Key? key, required this.imagePath, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72, // Set the desired width
        height: 72, // Set the desired height
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}