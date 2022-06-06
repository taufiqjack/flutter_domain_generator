import 'package:domaingen/core/repositorys/domain_result_repository.dart';
import 'package:domaingen/core/viewmodels/base_viewmodel.dart';
import 'package:domaingen/core/viewmodels/domain_result_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DomainResultRepo());

  locator.registerFactory(() => DomainResultViewmodel());
  locator.registerFactory(() => BaseViewModel());
}
