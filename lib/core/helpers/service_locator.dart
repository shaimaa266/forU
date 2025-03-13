


import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled1/core/web_services/api_service.dart';
import 'package:untitled1/features/home/data/repo/home_repo.dart';
import '../../features/details/data/repos/details_repo.dart';


final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepo>(
    HomeRepo(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<DetailsRepo>(
    DetailsRepo(getIt.get<ApiService>()),
  );
}