import 'package:amadis_customer/services/auth_service.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void startServiceInjection() {
  injector.registerLazySingleton(() => AuthService());
}
