import Flutter
import UIKit
import LogRocket

public class SwiftFlutterLogRocketPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_log_rocket", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterLogRocketPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "init":
      initLogRocket(call: call, result: result)
      break;
    case "setIdentity":
      setIdentity(call: call, result: result)
      break;
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  func initLogRocket(call: FlutterMethodCall, result: @escaping FlutterResult) {
    if let args = call.arguments as? Dictionary<String, Any> {
      let appId:String = args["app_id"] as! String
      let networkCaptureEnabled:Bool = args["capture_request"] as? Bool ?? true
      let logCaptureEnabled:Bool = args["capture_log"] as? Bool ?? true
      SDK.initialize(configuration: Configuration(appID: appId, networkCaptureEnabled: networkCaptureEnabled, logCaptureEnabled: logCaptureEnabled))
      result(nil)
    } else {
      result(FlutterError.init(code: "errorSetDebug", message: "data or format error", details: nil))
    }
  }

  func setIdentity(call: FlutterMethodCall, result: @escaping FlutterResult) {
    if let args = call.arguments as? Dictionary<String, Any> {
      let userId:String = args["user_id"] as! String
      let name:String = args["name"] as? String ?? "-"
      let email:String = args["email"] as? String ?? "-"

      let userInfo:Dictionary<String, Any>
      let userInfo:Dictionary<String, Any> = call.arguments as? Dictionary<String, Any>)

      SDK.identify(userID: userId, userInfo: userInfo)
      result(nil)
    } else {
      result(FlutterError.init(code: "errorSetDebug", message: "data or format error", details: nil))
    }
  }
}
