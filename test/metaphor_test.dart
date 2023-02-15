import 'package:flutter_test/flutter_test.dart';
import 'package:metaphor/metaphor.dart';
import 'package:metaphor/src/method_channel/metaphor_method_channel.dart';
import 'package:metaphor/src/platform_interface/metaphor_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMetaphorPlatform
    with MockPlatformInterfaceMixin
    implements MetaphorPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MetaphorPlatform initialPlatform = MetaphorPlatform.instance;

  test('$MethodChannelMetaphor is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMetaphor>());
  });

  test('getPlatformVersion', () async {
    Metaphor metaphorPlugin = Metaphor();
    MockMetaphorPlatform fakePlatform = MockMetaphorPlatform();
    MetaphorPlatform.instance = fakePlatform;

    expect(await metaphorPlugin.getPlatformVersion(), '42');
  });
}
