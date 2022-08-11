# flutter_log_rocket

A Flutter plugin for [Log Rocket Mobile SDK](https://docs.logrocket.com/docs/). Visit https://logrocket.com/.

---

## Supported Platforms

|             | Android | iOS  | Linux | macOS  | Web | Windows     |
|-------------|---------|------|-------|--------|-----|-------------|
| **Support** | SDK 19+ | 12.0+ | -   | - | - | - |

## Usage

To use this plugin, add `flutter_log_rocket` as a dependency in your [pubspec.yaml](https://flutter.dev/docs/development/packages-and-plugins/using-packages) file.

## Getting started

See the [example](example) directory for a sample about using `flutter_log_rocket`.

### Configuration

No setup required

---

### Usage

To start using Log Rocket you first need to create an instance of `FlutterLogRocket` before using any other of our sdk functionalities.  
`FlutterLogRocket` receives a `FlutterLogRocketConfig` object. This is how you can configure our `FlutterLogRocket` instance and connect it to your Log Rocket account.

*Example:*
```dart
import 'package:flutter_log_rocket/flutter_log_rocket.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterLogRocket.init(
      config: LogRocketConfig(
    appId: 'YOUR_APP_ID',
	enableBitmapCapture: true,
	captureLog: true,
	captureRequest: true,
	enableIpCapture: true,
  ));
  runApp(const MyApp());
}
```

---

### Initializing the SDK

The next step is to call `init` which have the required `LogRocketConfig` object parameter `config`.
After we call `init` we can use all of Log Rocket SDK features.
Initialize the SDK to enable Log Rocket to start capturing.

```dart
FlutterLogRocket.init(
    config: config,
);
```

---

### Identify User
Associate a user identifier with the active user. You can use any string that uniquely identifies the user of your application such as a database ID, an email, or a username.
```dart
FlutterLogRocket.setIdentity(userId: "123");
```