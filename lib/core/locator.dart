import 'package:get_it/get_it.dart';
import 'package:recipes_app/services/api_service.dart';
import 'package:recipes_app/services/database_service.dart';
import 'package:recipes_app/viewmodels/home_viewmodel.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerFactory(() => HomeViewmodel());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => DatabaseMigrationService());

}