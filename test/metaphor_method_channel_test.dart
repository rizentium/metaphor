import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metaphor/src/method_channel/metaphor_method_channel.dart';

void main() {
  MethodChannelMetaphor platform = MethodChannelMetaphor();
  const MethodChannel channel = MethodChannel('metaphor');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
