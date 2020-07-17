import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sklapp/entity/maindata.dart';
import 'package:sklapp/http/api.dart';
import 'package:sklapp/http/httpUtil.dart';

class PageviewTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageviewTwo();
}

class _PageviewTwo extends State<PageviewTwo> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    print('asdasd');
    _handleRefresh();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('PageviewTwo'),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  List<List_item> datas = List();
  Future<Null> _handleRefresh() async {

    try {
      var repost = await HttpUtil().post("",
          data: {"service": Api.MAINLIST, "currentpage": 1, "pagesize": 5});
      setState(() {
        datas = Maindata.map(jsonDecode(repost.toString())).data.list;
      });
//      print(datas);

    } catch (e) {
      print(e);
//      print(datas);
    }
    print(datas[0].masterName);
  }
}
