import 'package:dio/dio.dart';
import '../extension/enum.dart';

// ignore: constant_identifier_names
enum MetaphorRequestType { GET, POST, PUT, PATCH, DELETE }

class MetaphorRequestOptions extends RequestOptions {
  MetaphorRequestOptions({
    String path = '',
    MetaphorRequestType? method,
  }) : super(
          path: path,
          method: method?.getValue(),
        );
}

class MetaphorResolver extends Response {
  MetaphorResolver({
    dynamic data,
    Map<String, dynamic> extra = const {},
    Headers? headers,
    bool isRedirect = false,
    List<RedirectRecord> redirects = const [],
    required MetaphorRequestOptions requestOptions,
    int? statusCode,
    String? statusMessage,
  }) : super(
          data: data,
          extra: extra,
          headers: headers,
          isRedirect: isRedirect,
          redirects: redirects,
          requestOptions: requestOptions,
          statusCode: statusCode,
          statusMessage: statusMessage,
        );
}
