import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_nav_settings_platform_interface.dart';

/// An implementation of [AndroidNavSettingsPlatform] that uses method channels.
class MethodChannelAndroidNavSettings extends AndroidNavSettingsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_nav_settings');

  @override
  Future<int?> getNavigationMode() async {
    final int? mode = await methodChannel.invokeMethod<int>('getNavigationMode');
    return mode;
  }
}
