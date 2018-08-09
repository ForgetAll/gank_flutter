import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gank_flutter/data/gank_data.dart';
import 'package:gank_flutter/network/http.dart';


class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  int _index = 1;
  List<ResultsListBean> datas;
  final List<Tab> tabs = <Tab>[
    new Tab(text: 'Android'),
    new Tab(text: 'iOS'),
    new Tab(text: '前端'),
    new Tab(text: '技术'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('资讯'),
            bottom: TabBar(tabs: tabs,
              isScrollable: false,),
          ),

          body: TabBarView(
            children: [
              BeautyGirlPage(),
              Center(child: Text('iOS')),
              Center(child: Text('前端')),
              Center(child: Text('技术')),
            ],
          ),
        ));
  }
}

class BeautyGirlPage extends StatefulWidget {
  @override
  BeautyGirlState createState() => BeautyGirlState();
}

class BeautyGirlState extends State<BeautyGirlPage> {
  int _index = 1;
  List<ResultsListBean> _datas;
  final List<Tab> tabs = <Tab>[
    new Tab(text: 'Android'),
    new Tab(text: 'iOS'),
    new Tab(text: '前端'),
    new Tab(text: '技术'),
  ];

  @override
  void initState() {
    init();
  }

  void init() async {
    String response = await GankHttp.getGirls(_index);
    GankResponse gankResponse = GankResponse.fromRes(response);
    if (gankResponse.isSuccess()) {
      _index++;
      _datas = GirlsData
          .fromMap(gankResponse.map)
          .results;
      print(_datas);
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: _datas.length,
      itemBuilder: (BuildContext context, int index) =>
          Container(
//              color: Colors.green,
//              child: new Center(
//                child: new CircleAvatar(
//                  backgroundColor: Colors.white,
//                  child: new Text('$index'),
//                ),
//              )
            child: Image.network(
              _datas[index].url,
              fit: BoxFit.fitWidth,),
          ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 1),
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 4.0,
    );
  }

}