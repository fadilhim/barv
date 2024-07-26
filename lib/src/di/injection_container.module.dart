//@GeneratedMicroModule;BarvPackageModule;package:barv/src/di/injection_container.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:device_info_plus/device_info_plus.dart' as _i10;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:injectable/injectable.dart' as _i1;
import 'package:logger/logger.dart' as _i3;
import 'package:package_info_plus/package_info_plus.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../presentation/routers/router.dart' as _i4;
import '../utilities/platforms/src/device_platform.dart' as _i9;
import 'modules/internal_module.dart' as _i12;
import 'modules/third_party_module.dart' as _i11;
import 'utilities/bloc/default_bloc_observer.dart' as _i8;

const String _fuchsia = 'fuchsia';
const String _linux = 'linux';
const String _macos = 'macos';
const String _windows = 'windows';
const String _android = 'android';
const String _ios = 'ios';

class BarvPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) async {
    final thirdPartyModule = _$ThirdPartyModule();
    final internalModule = _$InternalModule();
    gh.factory<_i3.Logger>(() => thirdPartyModule.logger);
    gh.lazySingleton<_i4.BarvRouter>(() => internalModule.barvRouter);
    await gh.lazySingletonAsync<_i5.PackageInfo>(
      () => thirdPartyModule.packageInfo,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i6.SharedPreferences>(
      () => thirdPartyModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i7.FlutterSecureStorage>(
        () => thirdPartyModule.flutterSecureStorage);
    gh.lazySingleton<_i8.DefaultBlocObserver>(() => _i8.DefaultBlocObserver());
    gh.lazySingleton<_i9.DevicePlatformInfo>(
      () => _i9.DevicePlatformInfoOther(gh<_i5.PackageInfo>()),
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
    await gh.lazySingletonAsync<_i10.AndroidDeviceInfo>(
      () => thirdPartyModule.androidDeviceInfo,
      registerFor: {_android},
      preResolve: true,
    );
    gh.lazySingleton<_i9.DevicePlatformInfo>(
      () => _i9.DevicePlatformInfoAndroid(
        gh<_i5.PackageInfo>(),
        gh<_i10.AndroidDeviceInfo>(),
      ),
      registerFor: {_android},
    );
    await gh.lazySingletonAsync<_i10.IosDeviceInfo>(
      () => thirdPartyModule.iosDeviceInfo,
      registerFor: {_ios},
      preResolve: true,
    );
    gh.lazySingleton<_i9.DevicePlatformInfo>(
      () => _i9.DevicePlatformInfoIos(
        gh<bool>(instanceName: 'IsJailBroken'),
        gh<_i5.PackageInfo>(),
        gh<_i10.IosDeviceInfo>(),
      ),
      registerFor: {_ios},
    );
  }
}

class _$ThirdPartyModule extends _i11.ThirdPartyModule {}

class _$InternalModule extends _i12.InternalModule {}
