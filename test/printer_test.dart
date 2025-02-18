import 'package:flutter_test/flutter_test.dart';
import 'package:printer/printer.dart';
import 'package:printer/printer_platform_interface.dart';
import 'package:printer/printer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPrinterPlatform
    with MockPlatformInterfaceMixin
    implements PrinterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PrinterPlatform initialPlatform = PrinterPlatform.instance;

  test('$MethodChannelPrinter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPrinter>());
  });

  test('getPlatformVersion', () async {
    Printer printerPlugin = Printer();
    MockPrinterPlatform fakePlatform = MockPrinterPlatform();
    PrinterPlatform.instance = fakePlatform;

    expect(await printerPlugin.getPlatformVersion(), '42');
  });
}
