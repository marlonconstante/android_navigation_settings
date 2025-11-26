import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_navigation_settings/android_navigation_settings_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAndroidNavigationSettings platform = MethodChannelAndroidNavigationSettings();
  const MethodChannel channel = MethodChannel('android_navigation_settings');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
          (MethodCall methodCall) async {
        if (methodCall.method == 'getNavigationMode') {
          return 0; // Mock value, e.g., 0 for three-button navigation
        }
        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getNavigationMode', () async {
    expect(await platform.getNavigationMode(), 0);
  });
}