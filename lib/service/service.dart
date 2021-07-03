import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:newsapp/model/whatsnew/News.dart';
import 'package:newsapp/network/endpoint.dart';
import 'package:newsapp/util/MockData.dart';

class Services {

  Future<News> getWhatsNew() async {
    try {
      var response = await http
          .get(Uri.parse("$BASE_URL$WHATS_NEW"),headers: MockData.header)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        MockData.logger.e("eeee jsonResponse is=> ${response.body}");
        var jsonResponse = convert.jsonDecode(response.body);
        return News.fromJson(jsonResponse);
      } else {
        MockData.logger.e("eeee error is=> ${response.statusCode}");
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }

  Future<News> getHeadLine() async {
    try {
      var response = await http
          .get(Uri.parse("$BASE_URL$HEADLINE"),headers: MockData.header)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try agian");
      });

      if (response.statusCode == 200) {
        MockData.logger.e("eeee jsonResponse is=> ${response.body}");
        var jsonResponse = convert.jsonDecode(response.body);
        return News.fromJson(jsonResponse);
      } else {
        MockData.logger.e("eeee error is=> ${response.statusCode}");
        return null;
      }
    } on TimeoutException catch (_) {
      print("response time out");
    }
  }

}