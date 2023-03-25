import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String tag;
  final String tag2;
  final List<Widget>? actions;

  MyAppBar(
      {required this.title,
      this.actions,
      required this.tag,
      required this.tag2});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Hero(tag: tag2, child: Text(title)),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
