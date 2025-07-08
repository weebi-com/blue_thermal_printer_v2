import 'package:flutter_test/flutter_test.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:blue_thermal_printer/blue_thermal_printer_platform_interface.dart';
import 'package:blue_thermal_printer/blue_thermal_printer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBlueThermalPrinterPlatform
    with MockPlatformInterfaceMixin
    implements BlueThermalPrinterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BlueThermalPrinterPlatform initialPlatform = BlueThermalPrinterPlatform.instance;

  test('$MethodChannelBlueThermalPrinter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBlueThermalPrinter>());
  });

  test('getPlatformVersion', () async {
    BlueThermalPrinter blueThermalPrinterPlugin = BlueThermalPrinter();
    MockBlueThermalPrinterPlatform fakePlatform = MockBlueThermalPrinterPlatform();
    BlueThermalPrinterPlatform.instance = fakePlatform;

    expect(await blueThermalPrinterPlugin.getPlatformVersion(), '42');
  });
}
