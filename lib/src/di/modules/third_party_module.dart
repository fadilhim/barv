import 'package:barv/src/di/injection_container.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ThirdPartyModule {
  Dio get dio {
    final dio = Dio()
      ..options.headers.addAll(<String, dynamic>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      })
      ..options.connectTimeout = const Duration(seconds: 10)
      ..options.receiveTimeout = const Duration(seconds: 10)
      ..interceptors.addAll([
        DioCacheInterceptor(
          options: CacheOptions(
            store: MemCacheStore(
              maxSize: 20971520,
              maxEntrySize: 1572864,
            ),
            allowPostMethod: true,
          ),
        ),
      ]);

    return dio;
  }

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

  @Named('IsJailBroken')
  @lazySingleton
  @preResolve
  Future<bool> get isJailBroken => FlutterJailbreakDetection.jailbroken;

  Logger get logger => Logger();
}
