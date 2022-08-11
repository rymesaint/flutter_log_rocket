package com.rymesaint.flutter_log_rocket;

import android.app.Application;
import android.app.Activity;
import android.content.Context;

import com.logrocket.core.SDK;
import com.logrocket.core.Logger;

import java.util.HashMap;
import java.util.Map;

import androidx.annotation.NonNull;

import io.flutter.app.FlutterApplication;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterLogRocketPlugin */
public class FlutterLogRocketPlugin extends FlutterApplication implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context context;
  private Activity activity;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    context = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_log_rocket");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "init":
        init(call, result);
        break;
      case "setIdentity":
        setIdentity(call, result);
        break;
      default:
        result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivity() {
    channel.setMethodCallHandler(null);
  }

  private void init(MethodCall call, Result result) {
    String appId = call.argument("app_id");
    Boolean enableBitmapCapture = call.argument("enable_bitmap_capture");
    Boolean enableIpCapture = call.argument("enable_ip_capture");

    SDK.init(
      this,
      context,
      options -> {
        options.setAppID(appId);
        options.setEnableBitmapCapture(enableBitmapCapture);
        options.setEnableIPCapture(enableIpCapture);
      }
    );

    result.success(null);
  }

  private void setIdentity(MethodCall call, Result result) {
    String userId = call.argument("user_id");

    Map<String, String> userData = new HashMap<>();
    if (call.argument("user_info") != null) {
      userData.putAll(call.argument("user_info"));
    }

    SDK.identify(userId, userData);

    result.success(null);
  }
}
