import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dson/dson.dart';
import 'package:gank_flutter/data/gank_data.dart';

class GankHttp {
  static var httpClient = HttpClient();
  static var baseUrl = 'https://gank.io/api';

  static Future<String> get(String path) async {
    var request = await _get(path);
    var response = await request.close();
    var data = await response.transform(UTF8.decoder).join();
    print(data);
    return data;
  }

  static String _parseHttpUrl(String path) {
    if (path.contains(baseUrl)) {
      return path.replaceAll(baseUrl, '');
    }

    return path;
  }

  static Future<HttpClientRequest> _get(String path) {
//    path = _parseHttpUrl(path);
    print('baseUrl = $baseUrl path = $path');
    return httpClient.getUrl(Uri.parse(path));
  }
}