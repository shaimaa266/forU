
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/home/presentation/manager/home_provider.dart';
import 'package:untitled1/features/home/presentation/view/see_all_most_popular_movies.dart';

import '../../../../../core/helpers/navigate_to.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/shared/custom_text_button.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/font_styles.dart';
import 'most_popular_list_item.dart';
import 'most_popular_shimmer.dart';

class MostPopularMoviesSec extends StatelessWidget {
  const MostPopularMoviesSec({
    super.key,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Popular Movies',
                style: FontStyles.font20WhiteBold.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDarkTheme ? null : AppColors.kBackGroundColor,
                ),
              ),
              const Spacer(),
              CustomTextButton(
                text: 'See more',
                onPressed: () {
                  navigateTo(
                    context,
                    SeeAllMostPopularMoviesView(
                      mostPopularMoviesList: provider.mostPopularMoviesList,
                      isLoading: provider.mostPopularMoviesIsLoading,
                    ),
                  );
                },
              ),
              horizontalSpacer(20),
            ],
          ),
          verticalSpacer(16),
          SizedBox(
            height: 300.h,
            child: provider.mostPopularMoviesList.isNotEmpty &&
                !provider.mostPopularMoviesIsLoading
                ? ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) => horizontalSpacer(20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  MostPopularMoviesListViewItem(
                    mostPopularMoviesList: provider.mostPopularMoviesList,
                    index: index,
                    isDarkTheme: isDarkTheme,
                  ),
            )
                : Center(
              child: provider.mostPopularMoviesError != null
                  ? Text(
                provider.topMoviesError!,
                style: FontStyles.font18whiteMedium.copyWith(
                  color: isDarkTheme
                      ? null
                      : Colors.black
                      .withOpacity(0.20000000298023224),
                ),
              )
                  : const MostPopularShimmer(),
            ),
          ),
        ],
      ),
    );
  }
}