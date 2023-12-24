import 'package:tender_app/data/network/network_api_services.dart';
import 'package:tender_app/helper/api_end_points.dart';

class DashboardRepository{
  final _apiClient = NetworkApiServices();

  Future<dynamic> getAllTenders(var body) async{
    var url = ApiEndPoints.BASE_URL + ApiEvent.all_tenders;
    dynamic response = _apiClient.postApi(url, body);
    return response;
  }
}