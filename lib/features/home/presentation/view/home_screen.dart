
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/favourite/presentation/manage/fav_provider.dart';
import 'package:untitled1/features/home/presentation/view/widgets/image_page_sec.dart';
import 'package:untitled1/features/home/presentation/view/widgets/most_popular_movies_section.dart';
import 'package:untitled1/features/home/presentation/view/widgets/top_movies_list_view.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../profile/presentation/manage/app_theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Provider.of<AppThemeProvider>(context).isDarkTheme;
    Provider.of<FavouritesProvider>(context, listen: true).getFavourite();
    Provider.of<AppThemeProvider>(context).getStatusBar();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImagePageViewSec(isDarkTheme: isDarkTheme),
              MostPopularMoviesSec(isDarkTheme: isDarkTheme,),
              verticalSpacer(15),
              TopMoviesListView(isDarkTheme: isDarkTheme),
            ],
          ),
        ),
      ),
    );
  }
}