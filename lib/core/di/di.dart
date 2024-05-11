import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:toad_app/core/di/di.config.dart';

final locator = GetIt.instance;

@injectableInit
Future<void> initDependencies() async => locator.init();
