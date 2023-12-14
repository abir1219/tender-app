import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tender_app/data/network/base_api_services.dart';

import '../exceptions/app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  final dio = Dio();
  dynamic responseJson;

  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response = await dio.get(url, options: Options(headers: {}));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, dynamic body) async {
    Map<String, dynamic> headers = {};

    try {
      final response = await dio.post(url,
          data: jsonEncode(body), options: Options(headers: headers));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }

    return responseJson;
  }

  dynamic returnResponse(dynamic response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response);
        return responseJson;
      case 400:
        throw FetchDataException();
    }
  }
}
