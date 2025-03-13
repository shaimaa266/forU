
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/details/presentation/view/most_popular_datails_screen.dart';
import 'package:untitled1/features/favourite/presentation/manage/fav_provider.dart';
import 'package:untitled1/features/home/data/models/most_popular_movies_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/shared/custom_movies_list_item.dart';
import '../../../../core/shared/custom_movies_shimmer.dart';

class SeeAllMostPopularMoviesView extends StatelessWidget {
  const SeeAllMostPopularMoviesView({
    super.key,
    required this.mostPopularMoviesList,
    required this.isLoading,
  });

  final List<MostPopularMoviesModel> mostPopularMoviesList;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Most Popular Movies'),
      ),
      body: !isLoading
          ? ChangeNotifierProvider(
        create: (context) => FavouritesProvider()..getFavourite(),
        child: Consumer<FavouritesProvider>(
          builder: (context, value, child) {
            return ListView.separated(
              separatorBuilder: (context, index) => verticalSpacer(15),
              padding: EdgeInsets.only(left: 10.w, top: 20.h),
              itemCount: mostPopularMoviesList.length,
              itemBuilder: (context, index) => CustomMoviesListItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MostPopularMoviesDetailsScreen(
                          id: mostPopularMoviesList[index].id,
                          title: mostPopularMoviesList[index].title,
                        )),
                  );
                },
                imageUrl: mostPopularMoviesList[index].bigImage,
                title: mostPopularMoviesList[index].title,
                year: mostPopularMoviesList[index].year.toString(),
                rating: mostPopularMoviesList[index].rating.toString(),
                sorting: mostPopularMoviesList[index].genre,
              ),
            );
          },
        ),
      )
          : const CustomMoviesListShimmer(),
    );
  }
}