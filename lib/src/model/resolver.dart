import 'package:dio/dio.dart';

class MetaphorRequestOptions extends RequestOptions {
  MetaphorRequestOptions({
    String path = '',
    String? method,
  }) : super(
          path: path,
          method: method,
        ) {}
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
