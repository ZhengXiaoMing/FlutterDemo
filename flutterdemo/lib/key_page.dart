import 'package:flutter/material.dart';

class KeyPage extends StatefulWidget {
  static final String route = "Key";

  @override
  _KeyPageState createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  @override
  Widget build(BuildContext context) {
    print("page build");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded)),
        title: Text("KeyPage"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Cell(Colors.red), Cell(Colors.blue), Cell(Colors.blue)],
      )),
    );
  }
}

class Cell extends StatefulWidget {
  final Color color;
  Cell(this.color);
  @override
  State<StatefulWidget> createState() {
    return CellState();
  }
}

class CellState extends State<Cell> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    print("init state = $_count");
  }

  @override
  Widget build(BuildContext context) {
    print("cell build = $_count");
    return InkWell(
        onTap: () {
          setState(() {
            _count++;
          });
        },
        child: Container(
          width: 100,
          height: 100,
          color: widget.color,
          alignment: Alignment.center,
          child: Text(
            "$_count",
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}
