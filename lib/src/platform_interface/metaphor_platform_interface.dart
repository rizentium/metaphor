import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../method_channel/metaphor_method_channel.dart';

abstract class MetaphorPlatform extends PlatformInterface {
  /// Constructs a MetaphorPlatform.
  MetaphorPlatform() : super(token: _token);

  static final Object _token = Object();

  static MetaphorPlatform _instance = MethodChannelMetaphor();

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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
