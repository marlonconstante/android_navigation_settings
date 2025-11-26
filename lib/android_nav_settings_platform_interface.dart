import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_nav_settings_method_channel.dart';

abstract class AndroidNavSettingsPlatform extends PlatformInterface {
  /// Constructs a AndroidNavSettingsPlatform.
  AndroidNavSettingsPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidNavSettingsPlatform _instance = MethodChannelAndroidNavSettings();

  /// The default instance of [AndroidNavSettingsPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidNavSettings].
  static AndroidNavSettingsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidNavSettingsPlatform] when
  /// they register themselves.
  static set instance(AndroidNavSettingsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int?> getNavigationMode() {
    throw UnimplementedError('getNavigationMode() has not been implemented.');
  }
}