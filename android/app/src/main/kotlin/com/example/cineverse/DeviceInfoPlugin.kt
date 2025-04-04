package com.example.cineverse

import android.os.Build
import android.os.Environment
import android.os.StatFs
import android.content.Context
import android.os.BatteryManager
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class DeviceInfoPlugin(private val context: Context) : MethodChannel.MethodCallHandler {

    companion object {
        const val CHANNEL = "cineverse/device_info"

        fun register(channel: MethodChannel, context: Context) {
            channel.setMethodCallHandler(DeviceInfoPlugin(context))
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getDeviceInfo" -> result.success(getDeviceInfo())
            else -> result.notImplemented()
        }
    }

    private fun getDeviceInfo(): Map<String, String> {
        return mapOf(
            "deviceModel" to Build.MODEL,
            "osVersion" to "Android ${Build.VERSION.RELEASE}",
            "availableStorage" to getAvailableStorage(),
            "batteryLevel" to "${getBatteryLevel()}%"
        )
    }

    private fun getAvailableStorage(): String {
        val stat = StatFs(Environment.getDataDirectory().path)
        val sizeInGB = (stat.availableBlocksLong * stat.blockSizeLong).toDouble() / (1024 * 1024 * 1024)
        return String.format("%.2f GB", sizeInGB)
    }

    private fun getBatteryLevel(): Int {
        val batteryManager = context.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }
}
