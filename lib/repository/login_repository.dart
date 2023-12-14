import 'package:tender_app/data/network/network_api_services.dart';
import 'package:tender_app/helper/api_end_points.dart';

class LoginRepository{
  final _apiCall = NetworkApiServices();

  Future<dynamic> login() async{
    var url = ApiEndPoints.BASE_URL + ApiEvent.login;
    dynamic response = _apiCall.getApi(url);
    return response;
  }
}