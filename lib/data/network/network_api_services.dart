import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tender_app/data/network/base_api_services.dart';
import 'package:tender_app/utils/app_constants.dart';
import 'package:tender_app/utils/sharedpreference_utils.dart';

import '../exceptions/app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  final dio = Dio();
  dynamic responseJson;

  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response = await http.get(Uri.parse(url),);
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
    Map<String, String> headers = {
      'Content-Type': 'application/json'
    };

    try {
       // final response = await dio.post(url, data: jsonEncode(body), options: Options(headers: headers));
      var response = await http.post(Uri.parse(url), body: jsonEncode(body), headers: headers);
      debugPrint("POST--->$url ${response.body}");
      if(response.headers.containsKey('set-cookie')){
        debugPrint("COOKIE--->${response.headers['set-cookie']!}");
        Map<String, dynamic> decodedToken = JwtDecoder.decode(response.headers['set-cookie']!);
        debugPrint("COOKIE--->${decodedToken['_id']}");
        await SharedPreferencesUtils.init();
        SharedPreferencesUtils.saveString(AppConstants.USERID, decodedToken['_id']);

      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Internet Exception');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    }

    return responseJson;
  }

  dynamic returnResponse(dynamic response) {
    switch (response.statusCode) {
      // case 200:
      //   dynamic responseJSON =
      //   response.body.isNotEmpty ? json.decode(response.body) : null;
      //   // jsonDecode(response.body);
      //   return responseJSON;
      case 200:
        dynamic responseJSON = [jsonDecode(response.body),response.statusCode];
        return responseJSON;
      case 400:
        throw FetchDataException();
    }
  }

  @override
  Future<dynamic> putApi(String url, dynamic body) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json'
    };

    try {
      // final response = await dio.post(url, data: jsonEncode(body), options: Options(headers: headers));
      var response = await http.put(Uri.parse(url), body: jsonEncode(body), headers: headers);
      debugPrint("POST--->$url ${response.body}");
      if(response.headers.containsKey('set-cookie')){
        debugPrint("COOKIE--->${response.headers['set-cookie']!}");
        Map<String, dynamic> decodedToken = JwtDecoder.decode(response.headers['set-cookie']!);
        debugPrint("COOKIE--->${decodedToken['_id']}");
        await SharedPreferencesUtils.init();
        SharedPreferencesUtils.saveString(AppConstants.USERID, decodedToken['_id']);

      }

      responseJson = returnResponse(response);
      debugPrint("responseJson--->$responseJson");
    } on SocketException {
      throw InternetException('Internet Exception');
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    }

    return responseJson;
  }
}
