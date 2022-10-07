import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Controller extends ChangeNotifier {
  late MethodChannel platform =
      const MethodChannel('samples.flutter.dev/battery');
  Future<void> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    batteryLevels = batteryLevel;
    notifyListeners();
  }

  String batteryLevels = 'Unknown battery level.';
}
