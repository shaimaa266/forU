import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://imdb-top-100-movies.p.rapidapi.com/ ';
  final String apiKey = '4da7d89610msh8d16740c9e1aaf0p1548fbjsnf37da420c9d4';
  ApiService(this._dio);
  Future get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.get(
      '$baseUrl$endPoint',
      options: Options(
        receiveDataWhenStatusError: true,
        headers: {
          'x-rapidapi-host': 'imdb-top-100-movies.p.rapidapi.com',
          'x-rapidapi-key': apiKey,
        },
      ),
    );
    return response.data;
  }

  Future post({
    required String endPoint,
    String? token,
    Map<String, dynamic>? queryParameters,
    @required Map<String, dynamic>? data,
  }) async {
    var response = await _dio.post(
      '$baseUrl$endPoint',
      options: Options(
        headers: {
          'lang': 'lang',
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
        },
      ),
      queryParameters: queryParameters,
      data: data,
    );
    return response.data;
  }


}
