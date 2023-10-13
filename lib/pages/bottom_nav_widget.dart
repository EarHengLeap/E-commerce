import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({
    super.key, this.onTap, this.icon,
  });

  final void Function()? onTap;
  final IconData? icon;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 27,
        width: 36,
        child: FaIcon(
          icon,
          color: Colors.white,
        )
      ),
    );
  }
}