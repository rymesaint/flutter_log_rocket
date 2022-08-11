#import "FlutterLogRocketPlugin.h"
#if __has_include(<flutter_log_rocket/flutter_log_rocket-Swift.h>)
#import <flutter_log_rocket/flutter_log_rocket-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_log_rocket-Swift.h"
#endif

@implementation FlutterLogRocketPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterLogRocketPlugin registerWithRegistrar:registrar];
}
@end
