import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_navigation_settings_platform_interface.dart';

/// An implementation of [AndroidNavigationSettingsPlatform] that uses method channels.
class MethodChannelAndroidNavigationSettings extends AndroidNavigationSettingsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_navigation_settings');

  @override
  Future<int?> getNavigationMode() async {
    final int? mode = await methodChannel.invokeMethod<int>('getNavigationMode');
    return mode;
  }
}
