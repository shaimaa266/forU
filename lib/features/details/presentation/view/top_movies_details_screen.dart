
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/details/presentation/view/widgets/movies_details_fitrst.dart';
import 'package:untitled1/features/details/presentation/view/widgets/movies_details_shimmer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/helpers/service_locator.dart';
import '../../../../core/utils/theme/font_styles.dart';
import '../../../profile/presentation/manage/app_theme_provider.dart';
import '../../data/repos/details_repo.dart';
import '../manage/details_provider.dart';


class TopMoviesDetailsScreen extends StatelessWidget {
  const TopMoviesDetailsScreen({
    super.key,
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) =>
        DetailsProvider(getIt.get<DetailsRepo>())..getTopMovies(id: id),
        child: SingleChildScrollView(
          child: Consumer<DetailsProvider>(
            builder: (context, value, child) => value.topMoviesModel != null &&
                !value.topMoviesIsLoading
                ? MoviesDetailsFirstSec(
              sorting: value.topMoviesModel!.genre,
              image:  value.topMoviesModel!.image,
              isDarkTheme: isDarkTheme,
              controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      value.topMoviesModel!.trailer)!,
                  flags: const YoutubePlayerFlags(
                    autoPlay: false,
                  )),
              movieName: value.topMoviesModel!.title,
              description: value.topMoviesModel!.description,
              year: value.topMoviesModel!.year,
              rating: value.topMoviesModel!.rating.toString(),
            )
                : value.topMoviesError != null
                ? SizedBox(
                height: 300.h,
                child: Text(
                  value.topMoviesError!,
                  style: FontStyles.font18whiteMedium.copyWith(
                    color: isDarkTheme
                        ? null
                        : Colors.black.withOpacity(0.20000000298023224),
                  ),
                ))
                : const MoviesDetailsFirstSecShimmer(),
          ),
        ),
      ),
    );
  }
}