
import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/custon_toast.dart';

class CustomIcon extends StatelessWidget {
  final Icon icon;
   VoidCallback? onTap;
   CustomIcon({super.key,required this.icon,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: IconButton(
        icon:icon,
        color: Colors.white,
        onPressed: () {
          customSnackBar(msg: 'coming soon....');
        },
      ),
    );
  }
}
