import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_log_rocket/flutter_log_rocket_method_channel.dart';

void main() {
  // MethodChannelFlutterLogRocket platform = MethodChannelFlutterLogRocket();
  const MethodChannel channel = MethodChannel('flutter_log_rocket');

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
    // expect(await platform.getPlatformVersion(), '42');
  });
}
