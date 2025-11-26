import 'package:flutter_test/flutter_test.dart';
import 'package:android_navigation_settings/android_navigation_settings.dart';
import 'package:android_navigation_settings/android_navigation_settings_platform_interface.dart';
import 'package:android_navigation_settings/android_navigation_settings_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidNavigationSettingsPlatform
    with MockPlatformInterfaceMixin
    implements AndroidNavigationSettingsPlatform {

  @override
  Future<int?> getNavigationMode() => Future.value(0); // Mock value, e.g., 0 for three-button navigation
}

void main() {
  final AndroidNavigationSettingsPlatform initialPlatform = AndroidNavigationSettingsPlatform.instance;

  test('$MethodChannelAndroidNavigationSettings is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidNavigationSettings>());
  });

  test('getNavigationMode', () async {
    AndroidNavigationSettings androidNavigationSettingsPlugin = AndroidNavigationSettings();
    MockAndroidNavigationSettingsPlatform fakePlatform = MockAndroidNavigationSettingsPlatform();
    AndroidNavigationSettingsPlatform.instance = fakePlatform;

    expect(await androidNavigationSettingsPlugin.getNavigationMode(), 0);
  });
}