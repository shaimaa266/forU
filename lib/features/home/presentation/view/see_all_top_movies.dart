
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/details/presentation/view/top_movies_details_screen.dart';
import 'package:untitled1/features/favourite/presentation/manage/fav_provider.dart';
import 'package:untitled1/features/home/data/models/top_movies_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/shared/custom_movies_list_item.dart';
import '../../../../core/shared/custom_movies_shimmer.dart';

class SeeAllTopMoviesView extends StatelessWidget {
  const SeeAllTopMoviesView({
    super.key,
    required this.topMoviesList,
    required this.isLoading,
  });

  final List<MoviesModel> topMoviesList;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Series'),
      ),
      body: !isLoading
          ? ChangeNotifierProvider(
        create: (context) => FavouritesProvider()..getFavourite(),
        child: Consumer<FavouritesProvider>(
          builder: (context, value, child) {
            return ListView.separated(
              separatorBuilder: (context, index) => verticalSpacer(15),
              padding: EdgeInsets.only(left: 10.w, top: 20.h),
              itemCount: topMoviesList.length,
              itemBuilder: (context, index) => CustomMoviesListItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopMoviesDetailsScreen(
                        title: topMoviesList[index].title,
                        id: topMoviesList[index].id,
                      ),
                    ),
                  );
                },
                imageUrl: topMoviesList[index].bigImage,
                title: topMoviesList[index].title,
                year: topMoviesList[index].year,
                rating: topMoviesList[index].rating.toString(),
                sorting: topMoviesList[index].genre,
              ),
            );
          },
        ),
      )
          : const CustomMoviesListShimmer(),
    );
  }
}