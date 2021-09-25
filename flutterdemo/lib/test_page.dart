import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  static String route = "TestPage";

  final Widget someWidget = Container(
    width: 100,
    height: 100,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(children: [someWidget, someWidget]),
    );
  }
}
