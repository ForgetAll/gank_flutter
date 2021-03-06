import 'package:flutter/material.dart';
import 'package:gank_flutter/data/gank_data.dart';
import 'package:gank_flutter/info_ui/date_ui.dart';
import 'package:gank_flutter/info_ui/home.dart';
import 'package:gank_flutter/network/http.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gank io',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/infodate': (BuildContext context) => DatePage(),
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  MainState createState() => MainState();

}

class MainState extends State<MainPage> {

  _init() {
//    GankHttp.get('https://gank.io/api/day/history');
  }

  @override
  Widget build(BuildContext context) {
    _init();
    return Scaffold(
      appBar: AppBar(
        title: Text('Gank io'),
      ),
      body: Column(
        children: <Widget>[
          Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () => Navigator.of(context).pushNamed('/infodate'),
                    child: Text('时间浏览'),
                  ),
                )
              ]),
          Container(
            margin: EdgeInsets.only(top: 8.0),
          ),
          Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                      onPressed: () =>
                          Navigator.
                          of(context).pushNamed('/home'
                          ),
                      child: Text('浏览主页')
                      ,
                    )
                )
              ]),

          Container(
            margin: EdgeInsets.only(top: 8.0),
          )
        ],
      ),
    );
  }

}