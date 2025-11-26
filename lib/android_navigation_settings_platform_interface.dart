import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_navigation_settings_method_channel.dart';

abstract class AndroidNavigationSettingsPlatform extends PlatformInterface {
  /// Constructs a AndroidNavigationSettingsPlatform.
  AndroidNavigationSettingsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidNavigationSettingsPlatform _instance = MethodChannelAndroidNavigationSettings();

  /// The default instance of [AndroidNavigationSettingsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidNavigationSettings].
  static AndroidNavigationSettingsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidNavigationSettingsPlatform] when
  /// they register themselves.
  static set instance(AndroidNavigationSettingsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int?> getNavigationMode() {
    throw UnimplementedError('getNavigationMode() has not been implemented.');
  }
}