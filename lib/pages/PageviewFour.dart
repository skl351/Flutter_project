import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageviewFour extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageviewFour();
}

class _PageviewFour extends State<PageviewFour> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('PageviewFour'),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
