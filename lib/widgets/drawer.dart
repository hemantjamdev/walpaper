import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
Widget build(BuildContext context) {
  return Scaffold(
      body: SliderDrawer(
        //key: _key,
        appBar: SliderAppBar(
            appBarColor: Colors.white,
            title: Text("title",
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w700))),
        slider: Container(color: Colors.red),
        child: Container(color: Colors.amber),
      ));
}