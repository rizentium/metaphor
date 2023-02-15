import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

import '../model/resolver.dart';

class MetaphoreDioInterceptor extends Interceptor {
  final bool _isEnabled;
  final List<MetaphorResolver> _resolvers;
  MetaphoreDioInterceptor({
    bool isEnabled = true,
    List<MetaphorResolver> resolvers = const [],
  })  : _isEnabled = isEnabled,
        _resolvers = resolvers;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final item = _getItemOrNull(options);
    if (_isEnabled && item != null) {
      return handler.resolve(item);
    }
    super.onRequest(options, handler);
  }

  MetaphorResolver? _getItemOrNull(RequestOptions options) {
    final item = _resolvers.firstWhereOrNull((e) {
      final comparisson = [
        e.requestOptions.uri.path == options.uri.path,
        e.requestOptions.method == options.method,
      ];

      final matched = comparisson.firstWhereOrNull((e) => e == false) == null;

      if (matched) {
        return true;
      }
      return false;
    });

    return item;
  }
}
