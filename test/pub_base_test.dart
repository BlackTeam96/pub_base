import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pub_base/pub_base.dart';

void main() {
  const MethodChannel channel = MethodChannel('pub_base');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await PubBase.platformVersion, '42');
  });
}