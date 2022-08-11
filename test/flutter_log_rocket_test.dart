// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_log_rocket/flutter_log_rocket.dart';
// import 'package:flutter_log_rocket/flutter_log_rocket_platform_interface.dart';
// import 'package:flutter_log_rocket/flutter_log_rocket_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockFlutterLogRocketPlatform 
//     with MockPlatformInterfaceMixin
//     implements FlutterLogRocketPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final FlutterLogRocketPlatform initialPlatform = FlutterLogRocketPlatform.instance;

//   test('$MethodChannelFlutterLogRocket is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelFlutterLogRocket>());
//   });

//   test('getPlatformVersion', () async {
//     FlutterLogRocket flutterLogRocketPlugin = FlutterLogRocket();
//     MockFlutterLogRocketPlatform fakePlatform = MockFlutterLogRocketPlatform();
//     FlutterLogRocketPlatform.instance = fakePlatform;
  
//     expect(await flutterLogRocketPlugin.getPlatformVersion(), '42');
//   });
// }
