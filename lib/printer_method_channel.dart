import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'printer_platform_interface.dart';

/// An implementation of [PrinterPlatform] that uses method channels.
class MethodChannelPrinter extends PrinterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('printer');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
