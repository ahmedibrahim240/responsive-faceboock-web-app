import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double iconSize;
  const CircleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => onPressed(),
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
      ),
    );
  }
}
