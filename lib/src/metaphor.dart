import '../metaphor.dart';
import 'interceptor/dio_interceptor.dart';
import 'method_channel/metaphor_method_channel.dart';
import 'platform_interface/metaphor_platform_interface.dart';

class Metaphor {
  Metaphor._();

  static Metaphor initialize({
    MetaphorOptions? options,
    List<MetaphorResolver>? resolvers,
  }) {
    delegatePackingProperty = MethodChannelMetaphor(
      options: options ?? MetaphorOptions(),
      resolvers: resolvers ?? [],
    );
    return Metaphor._();
  }

  static MetaphorPlatform? delegatePackingProperty;

  static MetaphorPlatform get _delegate {
    return delegatePackingProperty ??= MetaphorPlatform.instance;
  }

  MetaphoreDioInterceptor dioInterceptor() => _delegate.dioInterceptor();
}
