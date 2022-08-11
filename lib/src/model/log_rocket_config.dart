class LogRocketConfig {
  String appId;
  bool? enableBitmapCapture;
  bool? enableIpCapture;
  bool? captureLog;
  bool? captureRequest;

  LogRocketConfig({
    required this.appId,
    this.enableBitmapCapture = true,
    this.captureLog = true,
    this.captureRequest = true,
    this.enableIpCapture = true,
  });

  Map<String, dynamic> toJson() => {
        'app_id': appId,
        'enable_bitmap_capture': enableBitmapCapture,
        'capture_log': captureLog,
        'capture_request': captureRequest,
        'enable_ip_capture': enableIpCapture,
      };
}
