import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:metaphor/src/interceptor/dio_interceptor.dart';

import '../../metaphor.dart';
import '../platform_interface/metaphor_platform_interface.dart';

/// An implementation of [MetaphorPlatform] that uses method channels.
class MethodChannelMetaphor extends MetaphorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('metaphor');

  static MethodChannelMetaphor get instance {
    return MethodChannelMetaphor._();
  }

  MethodChannelMetaphor._() : super(options: null);

  MethodChannelMetaphor({
    required MetaphorOptions options,
    required List<MetaphorResolver> resolvers,
  }) : super(options: options, resolvers: resolvers);

  @override
  MetaphoreDioInterceptor dioInterceptor() {
    bool? isEnabled = options?.isEnabled;
    List<MetaphorResolver>? resolvers = options?.resolvers;
    return MetaphoreDioInterceptor(
      isEnabled: isEnabled ??= true,
      resolvers: resolvers ??= [],
    );
  }
}
