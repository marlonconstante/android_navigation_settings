import 'package:flutter_test/flutter_test.dart';
import 'package:android_nav_settings/android_nav_settings.dart';
import 'package:android_nav_settings/android_nav_settings_platform_interface.dart';
import 'package:android_nav_settings/android_nav_settings_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidNavSettingsPlatform
    with MockPlatformInterfaceMixin
    implements AndroidNavSettingsPlatform {

  @override
  Future<int?> getNavigationMode() => Future.value(0); // Mock value, e.g., 0 for three-button navigation
}

void main() {
  final AndroidNavSettingsPlatform initialPlatform = AndroidNavSettingsPlatform.instance;

  test('$MethodChannelAndroidNavSettings is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidNavSettings>());
  });

  test('getNavigationMode', () async {
    AndroidNavSettings androidNavSettingsPlugin = AndroidNavSettings();
    MockAndroidNavSettingsPlatform fakePlatform = MockAndroidNavSettingsPlatform();
    AndroidNavSettingsPlatform.instance = fakePlatform;

    expect(await androidNavSettingsPlugin.getNavigationMode(), 0);
  });
}