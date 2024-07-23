import 'package:barv/src/presentation/routers/router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InternalModule {
  @lazySingleton
  BarvRouter get barvRouter => BarvRouter();
}
