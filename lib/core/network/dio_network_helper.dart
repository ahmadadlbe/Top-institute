import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


import '../error/exceptions.dart';
import '../storage/storage_handler.dart';
import '../strings/apis.dart';
import '../util/app_response.dart';
import 'network_helper.dart';

class DioNetworkHelper extends NetworkHelper {
  DioNetworkHelper._() : super.create();
  static DioNetworkHelper? _instance;

  factory DioNetworkHelper() => _instance ??= DioNetworkHelper._();

  static Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': '${StorageHandler().cachedLanguage}',
        //'language': StorageHandler().lang,
        if (StorageHandler().token != null)
          'Authorization': 'Bearer ${StorageHandler().token}',
      };

  /*static final customCacheOptions = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.forceCache,
    priority: CachePriority.high,
    maxStale: const Duration(days: 1),
    hitCacheOnErrorExcept: [401, 404],
    keyBuilder: (request) {
      return request.uri.toString();
    },
    allowPostMethod: false,
  );*/

  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 600000),
      receiveTimeout: const Duration(milliseconds: 300000),
      sendTimeout: const Duration(milliseconds: 300000),
      baseUrl: ApisWords.baseURL,
      responseType: ResponseType.json,
      followRedirects: true,
    ),
  );

  /*..interceptors.addAll(
      [
        DioCacheManager(CacheConfig(baseUrl: ApiConst.baseUrl)).interceptor,
        LoggingInterceptor()
      ]);
*/

  @override
  Future<AppResponse> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    bool isCached = false,
  }) async {
    try {
      log("url GET ==>  ${ApisWords.baseURL}$url");
      log("isCached ==> $isCached");
      log("header ==> $_headers");
      log("query parameters ==> $queryParameters");

      var response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: /*isCached?
          buildCacheOptions(

            const Duration(hours: 1),
            maxStale: const Duration(seconds: 10),
            options:Options(
              headers: {..._headers, if (headers != null) ...headers},
            )):*/
            Options(
          headers: {..._headers, if (headers != null) ...headers},
        ),
      );
      log("Options===>${response.requestOptions.extra}");
      log("Status Code ==> ${response.toAppResponse.statusCode}");
      log("Response ==> ${response.toAppResponse.data}");
      return response.toAppResponse;
    } on DioException catch (e, stack) {
      log("Dio Exception ==> ${e.message}");
      log("Dio Stack ==> $stack");
      log("Dio Exception Type ==> ${e.type} , Status Code ==> ${e.response?.statusCode}");
      log("response Error  ==> ${e.response}");
      if (e.response != null && e.response?.statusCode == null && isCached) {
        if (kDebugMode) {
          print("Errrror conditions");
        }
        throw ServerException(
          message: e.response!.data["message"],
          statusCode: e.response!.statusCode!,
        );
      } else if (e.response != null &&
          e.response?.statusCode == null &&
          !isCached) {
        if (kDebugMode) {
          print("Errrror conditions2");
        }
        throw ServerException(
          message: e.response!.data["message"],
          statusCode: e.response!.statusCode!,
        );
      }
      throw OfflineException();
    } catch (e, stack) {
      log("Error Catch ==> $e ,, in $stack");
      rethrow;
    }
  }

  @override
  Future<AppResponse> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? files,
  }) async {
    try {
      log("url POST ==> ${ApisWords.baseURL}$url");
      log("header ==> ${{..._headers, ...?headers}}");
      log("queryParameters ==> $queryParameters");
      log("body ==> $body");
      log("file ==> $files");
      dynamic data = body;
      if (files != null) {
        data = FormData.fromMap({
          if (body != null) ...body,
          ...files.map(
            (key, value) => MapEntry(key, MultipartFile.fromFileSync(value)),
          ),
        });
      }

      var response = await _dio.post(
        queryParameters: queryParameters,
        url,
        options:
            Options(headers: {..._headers, ...?headers}),
        data: data,
      );
      if (response.data['errors'] != null) {
        if (kDebugMode) {
          print(response.data['errors']);
        }
        throw ServerException(message: "", statusCode: 0);
      }

      log("Status Code ==> ${response.toAppResponse.statusCode}");
      log("Response ==> ${response.toAppResponse.data}");
      return response.toAppResponse;
    } on DioException catch (e, stack) {
      log("Dio Exception ==> ${e.message}");
      log("Dio Stack ==> $stack");
      log("Dio Exception Type ==> ${e.type}");
      log("response Error  ==> ${e.response}");
      if (e.response != null) {
        throw ServerException(
          message: e.response!.data["message"],
          statusCode: e.response!.statusCode!,
        );
      }
      throw OfflineException();
    } catch (e, stack) {
      log("Error Catch ==> $e ,, in $stack");
      rethrow;
    }
  }

  @override
  Future<AppResponse> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, String>? files,
  }) async {
    try {
      dynamic data = body;
      if (files != null) {
        data = FormData.fromMap({
          if (body != null) ...body,
          ...files.map(
            (key, value) => MapEntry(key, MultipartFile.fromFileSync(value)),
          ),
        });
      }
      var response = await _dio.put(
        url,
        options:
            Options(headers: {..._headers, if (headers != null) ...headers}),
        data: data,
      );
      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException(
          message: e.response!.data["message"],
          statusCode: e.response!.statusCode!,
        );
      }
      throw OfflineException();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppResponse> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      log("url Delete ==>  ${ApisWords.baseURL}$url");
      log("header ==> $_headers");
      log("query parameters ==> $queryParameters");
      var response = await _dio.delete(
        url,
        options:
            Options(headers: {..._headers, if (headers != null) ...headers}),
        data: body,
      );
      log("Options===>${response.requestOptions.extra}");
      log("Status Code ==> ${response.toAppResponse.statusCode}");
      log("Response ==> ${response.toAppResponse.data}");
      return response.toAppResponse;
    } on DioException catch (e, stack) {
      log("Dio Exception ==> ${e.message}");
      log("Dio Stack ==> $stack");
      log("Dio Exception Type ==> ${e.type} , Status Code ==> ${e.response?.statusCode}");
      log("response Error  ==> ${e.response}");
      if (e.response != null && e.response?.statusCode == null) {
        if (kDebugMode) {
          print("Errrror conditions");
        }
        throw ServerException(
          message: e.response!.data["message"],
          statusCode: e.response!.statusCode!,
        );
      }
      throw OfflineException();
    } catch (e) {
      rethrow;
    }
  }
}

extension DioToAppResponse on Response {
  AppResponse get toAppResponse => AppResponse(
        statusCode: statusCode ?? 400,
        data: data,
        headers: headers.map.map((key, value) => MapEntry(key, value.join(""))),
      );
}
