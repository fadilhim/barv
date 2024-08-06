//@GeneratedMicroModule;BarvPackageModule;package:barv/src/di/injection_container.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:device_info_plus/device_info_plus.dart' as _i833;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../presentation/routers/router.dart' as _i904;
import '../utilities/platforms/src/device_platform.dart' as _i134;
import 'modules/internal_module.dart' as _i839;
import 'modules/third_party_module.dart' as _i691;
import 'utilities/bloc/default_bloc_observer.dart' as _i190;

const String _fuchsia = 'fuchsia';
const String _linux = 'linux';
const String _macos = 'macos';
const String _windows = 'windows';
const String _android = 'android';
const String _ios = 'ios';

class BarvPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final thirdPartyModule = _$ThirdPartyModule();
    final internalModule = _$InternalModule();
    gh.factory<_i974.Logger>(() => thirdPartyModule.logger);
    gh.lazySingleton<_i190.DefaultBlocObserver>(
        () => _i190.DefaultBlocObserver());
    gh.lazySingleton<_i904.BarvRouter>(() => internalModule.barvRouter);
    await gh.lazySingletonAsync<_i655.PackageInfo>(
      () => thirdPartyModule.packageInfo,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => thirdPartyModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => thirdPartyModule.flutterSecureStorage);
    gh.lazySingleton<_i134.DevicePlatformInfo>(
      () => _i134.DevicePlatformInfoOther(gh<_i655.PackageInfo>()),
      registerFor: {
        _fuchsia,
        _linux,
        _macos,
        _windows,
      },
    );
    await gh.lazySingletonAsync<bool>(
      () => thirdPartyModule.isJailBroken,
      instanceName: 'IsJailBroken',
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i833.AndroidDeviceInfo>(
      () => thirdPartyModule.androidDeviceInfo,
      registerFor: {_android},
      preResolve: true,
    );
    gh.lazySingleton<_i134.DevicePlatformInfo>(
      () => _i134.DevicePlatformInfoAndroid(
        gh<_i655.PackageInfo>(),
        gh<_i833.AndroidDeviceInfo>(),
      ),
      registerFor: {_android},
    );
    await gh.lazySingletonAsync<_i833.IosDeviceInfo>(
      () => thirdPartyModule.iosDeviceInfo,
      registerFor: {_ios},
      preResolve: true,
    );
    gh.lazySingleton<_i134.DevicePlatformInfo>(
      () => _i134.DevicePlatformInfoIos(
        gh<bool>(instanceName: 'IsJailBroken'),
        gh<_i655.PackageInfo>(),
        gh<_i833.IosDeviceInfo>(),
      ),
      registerFor: {_ios},
    );
  }
}

class _$ThirdPartyModule extends _i691.ThirdPartyModule {}

class _$InternalModule extends _i839.InternalModule {}
