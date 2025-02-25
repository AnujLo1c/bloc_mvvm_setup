import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


import '../../res/app_url/app_url.dart';
import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  final Dio dio = Dio(BaseOptions(
    baseUrl: AppUrl.baseUrl,
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
  ));

  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic response;
    try {
      final rawResponse = await dio.get(url).timeout(const Duration(seconds: 10));
      response = returnResponse(rawResponse);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on DioException catch (e) {
      throw FetchDataException(e.message);
    }
    print(response);
    return response;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic response;
    try {
      final rawResponse = await dio.post(
        url,
        data: data,
      ).timeout(const Duration(seconds: 10));
      response = returnResponse(rawResponse);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on DioException catch (e) {
      throw FetchDataException(e.message);
    }

    if (kDebugMode) {
      print(response);
    }
    return response;
  }

  dynamic returnResponse(Response rawResponse) {
    switch (rawResponse.statusCode) {
      case 200 || 400:
        return rawResponse.data;
      default:
        throw FetchDataException(rawResponse.statusCode.toString());
    }
  }

  @override
  Future getDataApi(String url, Options options) async {
    dynamic response;
    try {
      Response rawResponse = await dio.get(url, options: options);
      // print(rawResponse);
      response = returnResponse(rawResponse);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on DioException catch (e) {
      throw FetchDataException(e.message);
    }
    return response;
  }
}
