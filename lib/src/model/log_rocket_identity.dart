import 'package:flutter_log_rocket/src/model/user_info.dart';

class LogRocketIdentity {
  String userId;
  UserInfo? userInfo;

  LogRocketIdentity({
    this.userInfo,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'userInfo': userInfo?.toJson(),
      };
}
