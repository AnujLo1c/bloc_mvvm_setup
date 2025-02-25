
import 'package:dio/dio.dart';

import '../../res/app_url/app_url.dart';
import '../network/network_api_service.dart';

class LoginRepository {

  final _apiService  = NetworkApiServices() ;

  Future<dynamic> loginApi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
    if(response==null){
      return "null";
    }
    return response ;
  }

  fetchUserDetails(String token) async{
   dynamic response=await _apiService.getDataApi(AppUrl.userdetails,Options(
     headers: {
       'Authorization': 'Bearer $token',
     },
   ));
     return response;
  }

}