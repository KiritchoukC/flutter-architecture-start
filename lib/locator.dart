import 'package:get_it/get_it.dart';

import 'core/services/authentication_service.dart';
import 'core/services/api.dart';
import 'app/home/home_model.dart';
import 'app/login/login_model.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => HomeModel());
}
