import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final Icon icon;
 final VoidCallback? onTap;

 const CustomIcon({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: IconButton(icon: icon, color: Colors.white, onPressed: onTap),
    );
  }
}
