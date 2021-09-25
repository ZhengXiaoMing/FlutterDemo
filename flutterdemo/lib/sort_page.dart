import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class SortPage extends StatefulWidget {
  static String route = "SortPage";
  @override
  _SortPageState createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> with TickerProviderStateMixin {
  List<int> _list = [0, 1, 2, 3, 4];
  TabController _tabController;

  int _lastNumber = 0;

  @override
  void dispose() {
    _tabController.removeListener(_tabControllerListener);
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  _tabControllerListener() {
    if (_tabController.index != _tabController.animation.value) {
      return;
    }
    _lastNumber = _list[_tabController.index];
  }

  @override
  Widget build(BuildContext context) {
    _list.shuffle();

    if (_tabController != null) {
      _tabController.removeListener(_tabControllerListener);
    }

    _tabController = TabController(
        initialIndex: _list.indexOf(_lastNumber),
        length: _list.length,
        vsync: this);
    _tabController.addListener(_tabControllerListener);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(SortPage.route),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverStickyHeader(
            header: Container(
              color: Colors.white,
              height: 50,
              child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.black,
                  tabs: _list
                      .map((e) => Text(
                            e.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ))
                      .toList()),
            ),
            sliver: SliverFillRemaining(
              child: TabBarView(
                  controller: _tabController,
                  children: _list
                      .map((e) => Center(
                            child: Container(
                              child: Text(
                                e.toString(),
                                style: TextStyle(fontSize: 100),
                              ),
                            ),
                          ))
                      .toList()),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
