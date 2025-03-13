
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/core/shared/custom_cached_image.dart';
import 'package:untitled1/features/details/presentation/view/most_popular_datails_screen.dart';
import 'package:untitled1/features/favourite/data/model/fav_model.dart';
import 'package:untitled1/features/favourite/presentation/manage/fav_provider.dart';
import 'package:untitled1/features/home/data/models/most_popular_movies_model.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/font_styles.dart';
import '../../../../../core/utils/theme/font_wieght_helper.dart';
import '../../../../../core/web_services/constants.dart';

class MostPopularMoviesListViewItem extends StatelessWidget {
  const MostPopularMoviesListViewItem(
      {super.key,
        required this.mostPopularMoviesList,
        required this.index,
        required this.isDarkTheme});

  final List<MostPopularMoviesModel> mostPopularMoviesList;
  final int index;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MostPopularMoviesDetailsScreen(
              id: mostPopularMoviesList[index].id,
              title: mostPopularMoviesList[index].title,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 140.w,
        height: 150.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Stack(
                children: [
                  CustomCachedNetworkImage(
                    imageUrl: mostPopularMoviesList[index].bigImage,
                    height: 200.h,
                    width: 150.w,
                  ),
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: Consumer<FavouritesProvider>(
                      builder: (BuildContext context, FavouritesProvider value,
                          Widget? child) {
                        return GestureDetector(
                          onTap: () {
                            context.read<FavouritesProvider>().insertFavourite(
                              favouritesModel: FavouritesModel(
                                title: mostPopularMoviesList[index].title,
                                email: email,
                                year: mostPopularMoviesList[index]
                                    .year
                                    .toString(),
                                rating: mostPopularMoviesList[index].rating,
                                image: mostPopularMoviesList[index].image,
                                isFavourite: 'true',
                                sorting: mostPopularMoviesList[index].genre,
                              ),
                            );
                          },
                          child: Icon(
                            context
                                .read<FavouritesProvider>()
                                .isFavoriteProduct(
                                mostPopularMoviesList[index].title)
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: context
                                .read<FavouritesProvider>()
                                .isFavoriteProduct(
                                mostPopularMoviesList[index].title)
                                ? AppColors.kPrimaryColor
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacer(12),
            Text(
              mostPopularMoviesList[index].title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: FontStyles.font16whiteMedium.copyWith(
                color: isDarkTheme ? null : AppColors.kBackGroundColor,
              ),
            ),
            verticalSpacer(5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.kPrimaryColor,
                  size: 18.w,
                ),
                horizontalSpacer(5),
                Text(
                  "${mostPopularMoviesList[index].rating}/10",
                  style: FontStyles.font14GrayRegular.copyWith(
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                horizontalSpacer(5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}