import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';

class GankHttp {
  static var httpClient = HttpClient();
  static String baseUrl = 'https://gank.io/api';
  static String _dateUrl = baseUrl + '/day/history';
  static String _girlUrl = baseUrl + '/data/福利';

  static Future<String> get(@required String path) async {
    var request = await _get(path);
    var response = await request.close();
    var data = await response.transform(UTF8.decoder).join();
    print(data);
    return data;
  }

  static Future<HttpClientRequest> _get(String path) {
//    path = _parseHttpUrl(path);
    print('baseUrl = $baseUrl path = $path');
    return httpClient.getUrl(Uri.parse(path));
  }

  static Future<String> getDate() {
    return get(_dateUrl);
  }

  static Future<String> getGirls(@required int index, [int count = 20]) {
    return get(_girlUrl + '/$count/$index');
  }
}