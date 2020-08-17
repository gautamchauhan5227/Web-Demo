import 'package:flutter/material.dart';
import 'package:web_demo/Widget/Strings.dart';

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(strings.welcome),
      ),
    );
  }
}
