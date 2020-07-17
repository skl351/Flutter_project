import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageviewOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageviewOne();
}

class _PageviewOne extends State<PageviewOne> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('PageviewOne'),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
