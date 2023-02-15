import 'package:flutter_test/flutter_test.dart';
import 'package:metaphor/src/interceptor/dio_interceptor.dart';
import 'package:metaphor/src/method_channel/metaphor_method_channel.dart';
import 'package:metaphor/src/model/options.dart';
import 'package:metaphor/src/model/resolver.dart';
import 'package:metaphor/src/platform_interface/metaphor_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMetaphorPlatform
    with MockPlatformInterfaceMixin
    implements MetaphorPlatform {
  @override
  // TODO: implement options
  MetaphorOptions? get options => throw UnimplementedError();

  @override
  MetaphoreDioInterceptor dioInterceptor() {
    // TODO: implement dioInterceptor
    throw UnimplementedError();
  }

  @override
  // TODO: implement resolvers
  List<MetaphorResolver>? get resolvers => throw UnimplementedError();
}

void main() {
  final MetaphorPlatform initialPlatform = MetaphorPlatform.instance;

  test('$MethodChannelMetaphor is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMetaphor>());
  });

  test('getPlatformVersion', () async {
    MockMetaphorPlatform fakePlatform = MockMetaphorPlatform();
    MetaphorPlatform.instance = fakePlatform;
  });
}
