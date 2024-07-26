import 'package:barv/src/di/injection_container.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ThirdPartyModule {
  @android
  @lazySingleton
  @preResolve
  Future<AndroidDeviceInfo> get androidDeviceInfo =>
      DeviceInfoPlugin().androidInfo;

  @ios
  @lazySingleton
  @preResolve
  Future<IosDeviceInfo> get iosDeviceInfo => DeviceInfoPlugin().iosInfo;

  @lazySingleton
  @preResolve
  Future<PackageInfo> get packageInfo => PackageInfo.fromPlatform();

  @lazySingleton
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();

  @Named('IsJailBroken')
  @lazySingleton
  @preResolve
  Future<bool> get isJailBroken => FlutterJailbreakDetection.jailbroken;

  Logger get logger => Logger();
}
