import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sklapp/config/config.dart';
import 'package:sklapp/customview/MyBaseViewTopBar.dart';

class TabBarModel {
  const TabBarModel({this.title, this.page, this.icon, this.selectIcon});

  final String title;
  final Widget icon;
  final Widget selectIcon;
  final Widget page;
}

class RootTabBar extends StatefulWidget {
  RootTabBar({this.pages, this.currentIndex = 0});

  final List pages;
  final int currentIndex;

  @override
  State<StatefulWidget> createState() => new RootTabBarState();
}

class RootTabBarState extends State<RootTabBar> {
  var pages = new List<BottomNavigationBarItem>();
  int currentIndex;
  var contents = new List<Offstage>();
  PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    pageController = PageController(initialPage: currentIndex);
    for (int i = 0; i < widget.pages.length; i++) {
      TabBarModel model = widget.pages[i];
      pages.add(
        new BottomNavigationBarItem(
          icon: model.icon,
          activeIcon: model.selectIcon,
          title: new Text(model.title, style: new TextStyle(fontSize: 12.0)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: pages,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      unselectedItemColor: mainTextColor,
      fixedColor: fixedColor,
      onTap: (int index) {
        setState(() => currentIndex = index);
        pageController.jumpToPage(currentIndex);
//        Notice.send(NCOVActions.toTabBarIndex(), index);
      },
      unselectedFontSize: 18.0,
      selectedFontSize: 18.0,
      elevation: 0,
    );

    String title() {
      if (currentIndex == 0) {
        return '页面one';
      } else if (currentIndex == 1) {
        return '页面two';
      } else if (currentIndex == 2) {
        return '页面three';
      } else {
        return '页面four';
      }
    }

    return Scaffold(
      bottomNavigationBar: Theme(
        data: new ThemeData(
          canvasColor: Colors.grey[50],
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: new Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: lineColor, width: 0.2))),
          child: bottomNavigationBar,
        ),
      ),
      appBar: MyBaseViewTopBar(
        childView: BaseTitleBar(
          title(),
          rightText: '点击',
          rightClick: () {
            print("点击来一下");
          },
        ),
        preferredSize: Size.fromHeight(50),
      ),
      body: new ScrollConfiguration(
        behavior: MyBehavior(),
        child: new PageView.builder(
          itemBuilder: (BuildContext context, int index) =>
              widget.pages[index].page,
          controller: pageController,
          itemCount: pages.length,
          physics: Platform.isAndroid
              ? new ClampingScrollPhysics()
              : new NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() => currentIndex = index);
          },
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    if (Platform.isAndroid || Platform.isFuchsia) {
      return child;
    } else {
      return super.buildViewportChrome(context, child, axisDirection);
    }
  }
}
