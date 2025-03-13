
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:untitled1/features/favourite/presentation/manage/fav_provider.dart';
import 'package:untitled1/features/home/data/repo/home_repo.dart';
import 'package:untitled1/features/home/presentation/manager/home_provider.dart';
import 'package:untitled1/features/layout/presentation/manage/bottom_nav_bar_provider.dart';

import '../../../../core/helpers/service_locator.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(
            getIt.get<HomeRepo>(),
          )
            ..getTopMovies()
            ..getMostPopularMovies(),
        ),

        ChangeNotifierProvider(
          create: (context) => FavouritesProvider(
          )..getFavourite(),
        ),
      ],
      child: Consumer<BottomNavBarProvider>(
        builder: (context, bottomNavLogic, child) {
          return Scaffold(
            body: bottomNavLogic.bottomScreen[bottomNavLogic.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: bottomNavLogic.currentIndex,
              onTap: (index) {
                bottomNavLogic.changeBottomScreen(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search_sharp,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.bookmark,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}