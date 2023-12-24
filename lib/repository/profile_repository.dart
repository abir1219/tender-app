import 'package:tender_app/data/network/network_api_services.dart';
import 'package:tender_app/helper/api_end_points.dart';
import 'package:tender_app/utils/app_constants.dart';
import 'package:tender_app/utils/sharedpreference_utils.dart';

class ProfileRepository{
  final _apiClient = NetworkApiServices();

  Future<dynamic> getProfile() async{
    await SharedPreferencesUtils.init();
    var url = ApiEndPoints.BASE_URL + ApiEvent.profile+SharedPreferencesUtils.getString(AppConstants.USERID)!;
    dynamic response = _apiClient.getApi(url);
    return response;
  }

  Future<dynamic> changePassword(var body) async{
    await SharedPreferencesUtils.init();
    var url = ApiEndPoints.BASE_URL + ApiEvent.change_passwod;
    dynamic response = _apiClient.putApi(url,body);
    return response;
  }
}