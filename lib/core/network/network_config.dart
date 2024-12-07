import 'package:bullets/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



class NetworkConfig {
  final normalHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'lang': 'en',
  };

  final dio = Dio(BaseOptions(
    baseUrl: ApiUrl.baseURL,
    connectTimeout:  Duration(seconds: 15) as int,
    receiveTimeout: const Duration(seconds: 15) as int ,
  ))
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 1000,
        //enabled: true
    ));

  // Dio _getDio(
  //     {bool needsAuth = false, Function? retry, bool isFormData = false}) {
  //   var customizedDio = dio;
  //   if (needsAuth) {
  //     customizedDio.interceptors.add(AuthTokenInterceptor(retry: retry!));
  //   }
  //
  //   return customizedDio;
  // }

  Future<Map<String, dynamic>> postRequest(String path,
      Map<String, dynamic>? data, Map<String, dynamic>? queryParameters,
      {bool needAuth = true}) async {
    final Response response = await dio
        .post(path, data: data, queryParameters: queryParameters);
    return response.data;
  }

  Future<Map<String, dynamic>> getRequest(String path,
      Map<String, dynamic>? data, Map<String, dynamic>? queryParameters,
      {bool needsAuth = true}) async {
    final Response response = await
        dio
        .get(path, queryParameters: queryParameters);
    return response.data;
  }

  Future<Map<String, dynamic>> deleteRequest(String path,
      Map<String, dynamic>? data, Map<String, dynamic>? queryParameters,
      {bool needAuth = true}) async {
    final Response response = await dio
        .delete(path, data: data, queryParameters: queryParameters);
    return response.data;
  }

  Future<Map<String, dynamic>> patchRequest(String path,
      Map<String, dynamic>? data, Map<String, dynamic>? queryParameters,
      {bool needAuth = true}) async {
    final Response response = await dio
        .patch(path, data: data, queryParameters: queryParameters);
    return response.data;
  }

  Future<Map<String, dynamic>> putRequest(String path,
      Map<String, dynamic>? data, Map<String, dynamic>? queryParameters,
      {bool needAuth = true}) async {
    final Response response = await dio
        .put(path, data: data, queryParameters: queryParameters);
    return response.data;
  }

  Future<Map<String, dynamic>> uploadRequest(
      String path,
      FormData data,
      Map<String, dynamic>? queryParameters,
      Function(int sent, int total)? progressListener,
      {bool needAuth = true}) async {
    final Response response = await dio.post(path,
        queryParameters: queryParameters, onSendProgress: progressListener);
    return response.data;
  }

  Future<Map<String, dynamic>> downloadRequest(String path, String,
      FormData data, Map<String, dynamic>? queryParameters, String savePath,
      {bool needAuth = true}) async {
    final Response response =
        await dio.download(path, savePath);
    return response.data;
  }

  void handleNetworkExceptions(){

  }
}
