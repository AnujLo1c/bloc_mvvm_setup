import 'package:dio/dio.dart';

abstract class BaseApiServices {

  Future<dynamic> getApi(String url) ;
  Future<dynamic> getDataApi(String url,Options option) ;

  Future<dynamic> postApi(dynamic data, String url) ;
}