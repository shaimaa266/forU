
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:untitled1/features/details/data/models/most_popular_model.dart';
import 'package:untitled1/features/details/data/models/top_movies_model.dart';

import '../../../../core/web_services/api_service.dart';
import '../../../../core/web_services/failure.dart';


class DetailsRepo {
  ApiService apiService;

  DetailsRepo(this.apiService);

  Future<Either<Failure, TopMoviesDetailsModel>> fetchTopMoviesDetailsMovies(String id) async {
    try {
      var response = await apiService.get(endPoint: 'series/$id');
      TopMoviesDetailsModel topMoviesList=TopMoviesDetailsModel.fromJson(response);
      return Right(topMoviesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  Future<Either<Failure, MostPopularDetailsModel>> fetchMostPopularDetailsMovies(String id) async {
    try {
      var response = await apiService.get(endPoint: id);
      MostPopularDetailsModel mostPopularDetailsModel = MostPopularDetailsModel.fromJson(response) ;
      return Right(mostPopularDetailsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {

        return Left(ServerFailure(e.toString()));
      }
    }
  }
}