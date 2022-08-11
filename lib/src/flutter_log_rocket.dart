import 'package:flutter/services.dart';
import 'package:flutter_log_rocket/src/model/log_rocket_config.dart';
import 'package:flutter_log_rocket/src/model/log_rocket_identity.dart';

class FlutterLogRocket {
  static const MethodChannel _channel = MethodChannel('flutter_log_rocket');

  static Future<void> init({
    required LogRocketConfig config,
  }) async {
    await _channel.invokeMethod('init', config.toJson());
  }

  static Future<void> setIdentity({
    required String userId,
    String? name,
    String? email,
  }) async {
    await _channel.invokeMethod(
        'setIdentity', LogRocketIdentity(userId: userId).toJson());
  }
}
