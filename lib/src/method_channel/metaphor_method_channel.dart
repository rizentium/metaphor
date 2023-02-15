import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../platform_interface/metaphor_platform_interface.dart';

/// An implementation of [MetaphorPlatform] that uses method channels.
class MethodChannelMetaphor extends MetaphorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('metaphor');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
