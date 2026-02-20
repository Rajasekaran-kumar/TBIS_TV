import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../utils/constant.dart';
import '../../utils/silent_notification_handler.dart';
import '../model/meta.dart';
import '../utils/error_code.dart';
import '../utils/strings.dart';
import '../utils/tbis_utils.dart';

class APIServices {
  static int connectionTimeOut = 30000;
  static int receiveTimeout = 30000;

  static Dio dio = Dio();
  var log = Logger();

  void configAPI() {
    dio = Dio();
    dio.options.connectTimeout = Duration(seconds: connectionTimeOut);
    dio.options.receiveTimeout = Duration(seconds: receiveTimeout);
    dio.options.headers["content-type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
  }

  bool validateRequest(String url) {
    if (url.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<Meta> processGetURL(String url, String authToken) async {
    logPrinting(" UUUUUUUUUUUUUUUUURL$url");
    if (validateRequest(url)) {
      bool isNetworkAvailable = await TBISUtils().isInternetConnected();
      if (isNetworkAvailable) {
        try {
          if (authToken != "") {
            dio.options.headers["Authorization"] = "Bearer $authToken";
          } else {
            dio.options.headers.remove("Authorization");
          }
          Response response = await dio.get(url);
          return _getGetResponse(response);
        } catch (error) {
          return handleError(error);
        }
      } else {
        Meta meta = Meta(
            statusCode: ErrorCode.INTERNET_ERROR,
            statusMsg: Strings.checkConnection);
        return meta;
      }
    } else {
      Meta meta = Meta(
          statusCode: ErrorCode.URL_NOT_VALID, statusMsg: "Not a valid URL");
      return meta;
    }
  }

  Future<Meta> processPostURL(String url, Map<String, dynamic> data,
      String authToken, bool isUrlEncoded) async {
    logPrinting(" UUUUUUUUUUUUUUUUURL$url");
    bool isNetworkAvailable = await TBISUtils().isInternetConnected();
    if (isNetworkAvailable) {
      if (validateRequest(url)) {
        if (authToken != "") {
          dio.options.headers["Authorization"] = "Bearer $authToken";
        } else {
          dio.options.headers.remove("Authorization");
        }
        try {
          Response response = isUrlEncoded
              ? await dio.post(
                  url,
                  data: data,
                  options:
                      Options(contentType: "application/x-www-form-urlencoded"),
                )
              : await dio.post(url, data: data);
          return _getPostResponse(response);
        } catch (e) {
          return handleError(e);
        }
      } else {
        Meta meta = Meta(
            statusCode: ErrorCode.URL_NOT_VALID, statusMsg: "Not a valid URL");
        return meta;
      }
    } else {
      Meta meta = Meta(
          statusCode: ErrorCode.INTERNET_ERROR,
          statusMsg: Strings.checkConnection);
      return meta;
    }
  }

  Meta throwError(int errorCode, String errorMsg) {
    Meta meta = Meta(statusCode: errorCode, statusMsg: errorMsg);
    return meta;
  }

  Meta handleError(error) {
    debugPrint("========== I am in ERROR ${error.type} ${error.toString()}");
    if (error.type == DioExceptionType.receiveTimeout) {
      return throwError(ErrorCode.CONNECTION_TIMEOUT, "Connection Timeout!");
    } else if (error.type == DioExceptionType.connectionError) {
      if (error.response.statusCode == 401 &&
          error.response.data == 'TOKEN EXPIRED') {
        SilentNotificationHandler silentNotificationHandler =
            SilentNotificationHandler.instance;
        silentNotificationHandler.updateData(
            {Constants.notificationKey: Constants.notificationTokenExpired});
      }
      return throwError(error.response.statusCode, error.response.toString());
    } else if (error.type == DioExceptionType.badResponse &&
        error.response.statusCode == 401) {
      return throwError(ErrorCode.COMMUNICATION_ERROR, "Token Expired");
    } else {
      return throwError(ErrorCode.COMMUNICATION_ERROR, "Communication Error");
    }
  }

  void logPrinting(String response) {
    log.d(response);
  }

  Meta _getPostResponse(Response response) {
    Meta data = Meta();
    if (response.statusCode == 200) {
      logPrinting(" UUUUUUUUUUUUUUUUURL${response.data}");

      if (response.data.toString().isNotEmpty) {
        data.statusMsg = jsonEncode(response.data);
        data.response = response.data;
        data.statusCode = response.statusCode!;
      }
    } else if (response.statusCode == 409 ||
        response.statusCode == 422 ||
        response.statusCode == 400) {
      data.statusMsg = response.data.toString();
      data.statusCode = response.statusCode!;
    } else {
      if (response.data != null && response.data.toString().isNotEmpty) {
        data.statusMsg = response.data.toString();
        data.statusCode = response.statusCode!;
      } else {
        data.statusMsg = response.data.toString();
        data.statusCode = response.statusCode!;
      }
    }
    return data;
  }

  Meta _getGetResponse(Response response) {
    Meta data = Meta();
    if (response.statusCode == 200) {
      logPrinting(" UUUUUUUUUUUUUUUUURL${response.data}");
      if (response.data.toString().isNotEmpty) {
        debugPrint("Sts Code ${response.statusCode!}");
        data.statusMsg = response.data.toString();
        data.response = response.data;
        // data.response = jsonDecode(response.data.toString());
        data.statusCode = response.statusCode!;
      }
    } else if (response.statusCode == 409 || response.statusCode == 422) {
      data.statusMsg = response.data.toString();
      data.statusCode = response.statusCode!;
    } else {
      if (response.data != null && response.data.toString().isNotEmpty) {
        data.statusMsg = response.data.toString();
        data.statusCode = response.statusCode!;
      } else {
        data.statusMsg = response.data.toString();
        data.statusCode = response.statusCode!;
      }
    }
    return data;
  }

  Future<double> getNetSpeed(String url) async {
    double finalDownloadRate = 0.0;
    var startTime = DateTime.now().millisecondsSinceEpoch;
    try {
      Response response = await dio.get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        ),
      );
      if (kDebugMode) {
        print(response.headers);
      }
      var endTime = DateTime.now().millisecondsSinceEpoch;
      var downloadElapsedTime = (endTime - startTime) / 1000.0;
      var contentLength = response.headers.value("content-length");
      var kbs = (int.parse(contentLength!)) / (1024);
      finalDownloadRate = (kbs / downloadElapsedTime);
      return finalDownloadRate;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return finalDownloadRate;
    }
  }
}
