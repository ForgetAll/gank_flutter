class GankData<T> {
  bool error = false;

  isSuccess() {
    return !error;
  }

  InfoDate data;
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
