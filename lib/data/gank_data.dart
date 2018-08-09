import 'dart:convert';

class GankResponse {
  GankResponse([this.error]);

  bool error = false;
  Map<String, dynamic> map;

  isSuccess() {
    return !error;
  }

  static GankResponse fromRes(String response) {
    if (response == null) return GankResponse(false);
    return _fromJson(response);
  }

  static GankResponse _fromJson(String json) {
    var map = JsonDecoder().convert(json);
    return GankResponse()
      ..error = map['error']
      ..map = map;
  }
}

class InfoDate {
  List<String> results;

  InfoDate({
    this.results,
  });

  static InfoDate fromMap(Map<String, dynamic> map) {
    InfoDate infoDate = new InfoDate();

    List<dynamic> dynamicList0 = map['results'];
    infoDate.results = new List();
    infoDate.results.addAll(dynamicList0.map((o) => o.toString()));

    return infoDate;
  }

  static List<InfoDate> fromMapList(dynamic mapList) {
    List<InfoDate> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class GirlsData {
  bool error;
  List<ResultsListBean> results;

  GirlsData({
    this.error,
    this.results,
  });

  static GirlsData fromMap(Map<String, dynamic> map) {
    GirlsData temp = new GirlsData();
    temp.error = map['error'];
    temp.results = ResultsListBean.fromMapList(map['results']);
    return temp;
  }

  static List<GirlsData> fromMapList(dynamic mapList) {
    List<GirlsData> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class ResultsListBean {
  String id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;
  bool used;

  ResultsListBean([
    this.id,
    this.createdAt,
    this.desc,
    this.publishedAt,
    this.source,
    this.type,
    this.url,
    this.who,
    this.used,
  ]);

  static ResultsListBean fromMap(Map<String, dynamic> map) {
    ResultsListBean resultsListBean = new ResultsListBean();
    resultsListBean.id = map['_id'];
    resultsListBean.createdAt = map['createdAt'];
    resultsListBean.desc = map['desc'];
    resultsListBean.publishedAt = map['publishedAt'];
    resultsListBean.source = map['source'];
    resultsListBean.type = map['type'];
    resultsListBean.url = map['url'];
    resultsListBean.who = map['who'];
    resultsListBean.used = map['used'];
    return resultsListBean;
  }

  static List<ResultsListBean> fromMapList(dynamic mapList) {
    List<ResultsListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }


}
