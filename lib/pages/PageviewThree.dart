import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageviewThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageviewThree();
}

class _PageviewThree extends State<PageviewThree> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('PageviewThree'),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
