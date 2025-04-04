import Flutter

import UIKit

class DeviceInfoPlugin: NSObject, FlutterPlugin {

    static let CHANNEL = "cineverse/device_info"

    static func register(with registrar: FlutterPluginRegistrar) {

        let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: registrar.messenger())
        let instance = DeviceInfoPlugin()

        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getDeviceInfo" {
            result(getDeviceInfo())
        } else {
            result(FlutterMethodNotImplemented)
        }

    }

    private func getDeviceInfo() -> [String: String] {
        let device = UIDevice.current
        let storage = getAvailableStorage()

        return [
            "deviceModel": device.name,
            "osVersion": "iOS \(device.systemVersion)",
            "availableStorage": storage,
            "batteryLevel": "\(getBatteryLevel())%"
        ]
    }

    private func getBatteryLevel() -> Int {
        UIDevice.current.isBatteryMonitoringEnabled = true
        return Int(UIDevice.current.batteryLevel * 100)
    }

    private func getAvailableStorage() -> String {
        let fileManager = FileManager.default

        if let attributes = try? fileManager.attributesOfFileSystem(forPath: NSHomeDirectory()),
           let freeSize = attributes[.systemFreeSize] as? Int64 {
            let sizeInGB = Double(freeSize) / (1024 * 1024 * 1024)
            return String(format: "%.2f GB", sizeInGB)
        }
        return "0 GB"
    }

}
