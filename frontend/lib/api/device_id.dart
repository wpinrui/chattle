import 'package:device_info_plus/device_info_plus.dart';

class DeviceId {
  static String? _deviceId;

  static Future<String> get() async {
    _deviceId ??= await getDeviceId();
    return _deviceId!;
  }

  static Future<String> getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId;
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.serialNumber;
    return deviceId;
  }
}
