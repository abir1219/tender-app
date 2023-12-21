import 'package:flutter/material.dart';
import 'package:tender_app/data/network/network_api_services.dart';
import 'package:tender_app/helper/api_end_points.dart';

class LoginRepository{
  final _apiCall = NetworkApiServices();

  Future<dynamic> login(var body) async{
    var url = ApiEndPoints.BASE_URL + ApiEvent.login;
    debugPrint("LOGIN_URL==>$url");
    dynamic response = _apiCall.postApi(url,body);
    return response;
  }
}