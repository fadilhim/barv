/// Configuration for api endpoint.
///
/// Can also be used to change the endpoint based on whether the build is for
/// staging or production.
abstract class ApiConfig {
  /// API URL.
  late String baseUrl;
}

/// This is only meant to be example in the implementor repository\
/// Note that we define this in two different Environment
///
///
/// @staging
// @LazySingleton(as: ApiConfig)
// class ApiConfigStaging implements ApiConfig {
//   @override
//   String baseUrl = '';
// }
//
// @production
// @LazySingleton(as: ApiConfig)
// class ApiConfigProduction implements ApiConfig {
//   @override
//   String baseUrl = '';
// }
