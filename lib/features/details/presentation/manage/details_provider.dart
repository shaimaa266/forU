

import 'package:flutter/foundation.dart';

import '../../data/models/most_popular_model.dart';
import '../../data/models/top_movies_model.dart';
import '../../data/repos/details_repo.dart';

class DetailsProvider extends ChangeNotifier {
  DetailsRepo detailsRepo;
  TopMoviesDetailsModel ?topMoviesModel;
  MostPopularDetailsModel? mostPopularMoviesModel;
  String ? topMoviesError;
  bool topMoviesIsLoading = false;
  bool mostPopularMoviesIsLoading = false;
  String ? mostPopularMoviesError;


  DetailsProvider(this.detailsRepo);

  void topMoviesIsLoadingChange(bool value) {
    topMoviesIsLoading = value;
    notifyListeners();

  }

  void mostPopularMoviesIsLoadingChange(bool value) {
    mostPopularMoviesIsLoading = value;
    notifyListeners();
  }

  Future getTopMovies({required String id}) async {
    topMoviesIsLoadingChange(true);
    var response = await detailsRepo.fetchTopMoviesDetailsMovies(id);
    response.fold((error) {
      topMoviesError = error.toString();
      topMoviesIsLoadingChange(false);
      notifyListeners();
    }, (topMovies) {
      topMoviesModel = topMovies;
      topMoviesIsLoadingChange(false);
      notifyListeners();
    });
  }
  Future getMostPopularMovies({required String id}) async {
    mostPopularMoviesIsLoadingChange(true);
    var response = await detailsRepo.fetchMostPopularDetailsMovies(id);
    response.fold((error) {
      mostPopularMoviesError = error.toString();
      mostPopularMoviesIsLoadingChange(false);
      notifyListeners();
    }, (mostPopularMovies) {
      mostPopularMoviesModel = mostPopularMovies;
      mostPopularMoviesIsLoadingChange(false);
      notifyListeners();
    });
  }
}