import 'package:metaphor/metaphor.dart';
import 'package:metaphor/src/interceptor/dio_interceptor.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../method_channel/metaphor_method_channel.dart';

abstract class MetaphorPlatform extends PlatformInterface {
  final MetaphorOptions? options;

  final List<MetaphorResolver>? resolvers;

  /// Constructs a MetaphorPlatform.
  MetaphorPlatform({this.options, this.resolvers}) : super(token: _token);

  static final Object _token = Object();

  static MetaphorPlatform _instance = MethodChannelMetaphor.instance;

  /// The default instance of [MetaphorPlatform] to use.
  ///
  /// Defaults to [MethodChannelMetaphor].
  static MetaphorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MetaphorPlatform] when
  /// they register themselves.
  static set instance(MetaphorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  MetaphoreDioInterceptor dioInterceptor() {
    throw UnimplementedError('dioInterceptor() has not been implemented.');
  }
}
