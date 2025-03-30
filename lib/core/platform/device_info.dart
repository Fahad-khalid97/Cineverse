import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

class DeviceInfo {
  final String deviceModel;
  final String osVersion;
  final String availableStorage;
  final String batteryLevel;

  DeviceInfo({
    required this.deviceModel,
    required this.osVersion,
    required this.availableStorage,
    required this.batteryLevel,
  });

  factory DeviceInfo.fromMap(Map<dynamic, dynamic> map) {
    return DeviceInfo(
      deviceModel: map['deviceModel'] ?? 'Unknown',
      osVersion: map['osVersion'] ?? 'Unknown',
      availableStorage: map['availableStorage'] ?? 'Unknown',
      batteryLevel: map['batteryLevel'] ?? 'Unknown',
    );
  }
}

@lazySingleton
class DeviceInfoService {
  static const MethodChannel _channel = MethodChannel('cineverse/device_info');

  Future<DeviceInfo> getDeviceInfo() async {
    try {
      final result = await _channel.invokeMethod('getDeviceInfo');
      return DeviceInfo.fromMap(result);
    } on PlatformException catch (e) {
      return DeviceInfo(
        deviceModel: 'Error: ${e.message}',
        osVersion: 'Unknown',
        availableStorage: 'Unknown',
        batteryLevel: 'Unknown',
      );
    }
  }
}
