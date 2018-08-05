import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gank_flutter/data/gank_data.dart';
import 'package:gank_flutter/network/http.dart';

class DatePage extends StatefulWidget {
  @override
  DateState createState() => DateState();

}

class DateState extends State<DatePage> {
  List<String> datas = [];

  @override
  void initState() {
    init();
  }

  Future init() async {
    String str = await GankHttp.get('https://gank.io/api/day/history');
    Map map = JSON.decode(str);
    datas = InfoDate
        .fromMap(map)
        .results;

    print(datas);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
            title: Text('按时间浏览'),
          ),
          body: ListView.builder(
            itemBuilder: (BuildContext context, int position) =>
                _getRow(position),
            itemCount: datas.length,
//            padding: EdgeInsets.only(left: 16.0,),
          )
      );
  }

  Widget _getRow(int i) {
    if (datas[i] != null) {
      return GestureDetector(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 16.0, bottom: 16.0, left: 16.0),
                    child: Text('${datas[i]}',
                      style: TextStyle(
                          fontSize: 17.0
                      ),),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Divider(
              height: 1.0,
            )
          ],
        ),

        onTap: () => print('${datas[i]}'),
      );
    }

    return null;
  }

}