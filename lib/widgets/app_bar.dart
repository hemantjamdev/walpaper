import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget widget;
  final List<Widget>? actions;

  MyAppBar({required this.widget, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
