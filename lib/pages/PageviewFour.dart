import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PageviewFour extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PageviewFour();
}

class _PageviewFour extends State<PageviewFour> with AutomaticKeepAliveClientMixin{
  var list=['images/bottom_home.png','images/bottom_lore.png'];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  new Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.asset(list[index]);
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
