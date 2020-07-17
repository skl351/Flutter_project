import 'package:flutter/material.dart';
import 'package:sklapp/pages/PageviewFour.dart';
import 'package:sklapp/pages/PageviewOne.dart';
import 'package:sklapp/pages/PageviewThree.dart';
import 'package:sklapp/pages/PageviewTwo.dart';

import 'widget/TabBarModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  DateTime _lastTime=null;
  @override
  Widget build(BuildContext context) {
    List<TabBarModel> pages = <TabBarModel>[
      new TabBarModel(
        title: '页面1',
        icon: new LoadImage("images/bottom_home.png", false),
        selectIcon: new LoadImage("images/bottom_home.png", true),
        page: new PageviewOne(),
      ),
      new TabBarModel(
        title: '页面2',
        icon: new LoadImage("images/bottom_rumor.png", false),
        selectIcon: new LoadImage("images/bottom_rumor.png", true),
        page: new PageviewTwo(),
      ),
      new TabBarModel(
        title: '页面3',
        icon: new LoadImage("images/bottom_protect.png", false),
        selectIcon: new LoadImage("images/bottom_protect.png", true),
        page: new PageviewThree(),
      ),
      new TabBarModel(
        title: '页面4',
        icon: new LoadImage("images/bottom_lore.png", false),
        selectIcon: new LoadImage("images/bottom_lore.png", true),
        page: new PageviewFour(),
      ),
    ];
    return WillPopScope(
      child:  new RootTabBar(pages: pages, currentIndex: 0),
      onWillPop: () async {
        if (_lastTime == null ||
            DateTime.now().difference(_lastTime) >
                Duration(milliseconds: 2000)) {
          _lastTime = DateTime.now();
          return false;
        } else {
          return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text('退出App'),
                  content: Text('别怪我没告诉你哦'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('CANCEL',),
                      onPressed: (){
                        Navigator.pop(context, false);
                      },
                    ),FlatButton(
                      child: Text('SURE',),
                      onPressed: (){
                        Navigator.pop(context, true);
                      },
                    ),
                  ],
                );
              }
          );
        }
      },
    );

  }
}

class LoadImage extends StatelessWidget {
  final String img;
  final bool isSelect;

  LoadImage(this.img, [this.isSelect = false]);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 2.0),
      width: 30.0,
      height: 30.0,
      child: new Image.asset(
        img,
        fit: BoxFit.cover,
        gaplessPlayback: true,
        color: isSelect ? Colors.blue : Colors.red,
      ),
    );
  }
}
