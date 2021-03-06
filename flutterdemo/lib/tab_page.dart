import 'package:flutter/material.dart';
import 'package:flutterdemo/scrollable_widget.dart';

class TabPage extends StatefulWidget {
  static final String route = "TabPage";

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<GlobalKey> _keys = [GlobalKey(), GlobalKey()];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_tabControllerListener);
  }

  _tabControllerListener() {
    if (_tabController.index != _tabController.animation.value) {
      return;
    }
    GlobalKey key = _keys[_tabController.previousIndex];
    if (key.currentState == null) {
      return;
    }

    ScrollerState state = key.currentState;
    state.scrollToTop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded)),
        title: Text("TabPage"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            child: TabBar(
                controller: _tabController,
                labelColor: Colors.red,
                labelStyle: TextStyle(fontSize: 16, color: Colors.red),
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle:
                    TextStyle(fontSize: 16, color: Colors.black),
                tabs: ["左", "右"]
                    .map((e) => Text(
                          e,
                        ))
                    .toList()),
          ),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: _keys
                      .map((e) => TabView(
                            key: e,
                          ))
                      .toList()))
        ],
      ),
    );
  }
}

class TabView extends ScrollableWidget {
  TabView({Key key}) : super(key: key);
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends ScrollerState<TabView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
        controller: scrollController,
        itemExtent: 50,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(index.toString()),
          );
        });
  }
}
