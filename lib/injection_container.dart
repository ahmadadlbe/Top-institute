import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';


final sl = GetIt.instance;

late SharedPreferences prefs;

Future<void> init() async {
  prefs = await SharedPreferences.getInstance();


// ==============================
  // Feature - Login
  //Bloc : ====================>
  // sl.registerFactory(() => LoginCubit(
  //       loginUseCase: sl(),
  //     ));
 
  // //UseCase : =================>
  // sl.registerLazySingleton(() => LoginUseCase(sl()));
 
  // //DataSource :===============>
  // sl.registerLazySingleton<LoginRemoteDataSource>(
  //   () => LoginRemoteDataSourceImpl(),
  // );

  

  // //Repository:================>
  // sl.registerLazySingleton<LoginRepositories>(() => LoginRepositoriesImpl(
  //       loginRemoteDataSource: sl(),
  //       networkInfo: sl(),
  //     ));

 
  //=================================================

//Core : ====================>
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
//External : ================>
  sl.registerLazySingleton(() => InternetConnectionChecker());

}
