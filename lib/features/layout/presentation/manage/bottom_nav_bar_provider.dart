
import 'package:flutter/material.dart';
import 'package:untitled1/features/favourite/presentation/view/fav_screen.dart';
import 'package:untitled1/features/home/presentation/view/home_screen.dart';

import '../../../profile/presentation/view/profile_view.dart';
import '../../../search/search_view.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> bottomScreen = [
    const HomeScreen(),
    const SearchView(),
    const FavouritesScreen(),
    const ProfileView()
  ];

  void changeBottomScreen(index) {
    currentIndex = index;
    notifyListeners();
  }
}