import 'package:flutter/material.dart';

class ScrollableWidget extends StatefulWidget {
  ScrollableWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ScrollerState();
  }
}

class ScrollerState<T extends ScrollableWidget> extends State<T> with Scroller {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

mixin Scroller {
  ScrollController scrollController = ScrollController();
  scrollToTop({bool animated = false}) {
    scrollToOffset(0, animated: animated);
  }

  scrollToOffset(double offset, {bool animated = false}) {
    if (animated) {
      scrollController.animateTo(offset,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      scrollController.jumpTo(offset);
    }
  }
}
