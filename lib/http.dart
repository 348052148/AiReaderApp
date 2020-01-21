

import 'package:dio/dio.dart';

class HttpUtils {
  static Dio dio = Dio();
  static get(String url) async {
    Response resp = await dio.get(url);
    return resp;
  }

}