import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/core/helpers/cache_helper.dart';
import 'package:untitled1/core/helpers/service_locator.dart';
import 'package:untitled1/core/routing/routes.dart';
import 'package:untitled1/features/auth/presentation/manage/login_provider.dart';
import 'package:untitled1/features/auth/presentation/manage/register_provider.dart';
import 'package:untitled1/features/auth/presentation/view/login_screen.dart';
import 'package:untitled1/features/auth/presentation/view/register_screen.dart';
import 'package:untitled1/features/favourite/presentation/manage/fav_provider.dart';
import 'package:untitled1/features/favourite/presentation/view/fav_screen.dart';
import 'package:untitled1/features/home/data/repo/home_repo.dart';
import 'package:untitled1/features/home/presentation/manager/home_provider.dart';
import 'package:untitled1/features/intro/onboarding/onboarding_view.dart';
import 'package:untitled1/features/layout/presentation/view/layout_view.dart';
import 'package:untitled1/features/profile/presentation/manage/account_editing_provider.dart';
import 'package:untitled1/features/profile/presentation/view/account_view.dart';
import 'package:untitled1/features/profile/presentation/view/change_pass_view.dart';
import 'package:untitled1/features/profile/presentation/view/language_view.dart';
import '../../features/profile/presentation/view/theme_view.dart';

class AppRouter {
  dynamic onBoarding = CacheHelper.getData(key: 'onboarding');
  dynamic token = CacheHelper.getData(key: 'token');

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoutes:
        return MaterialPageRoute(
          builder:
              (context) =>
                  onBoarding == null
                      ? const OnboardingView()
                      : (token == null
                          ? ChangeNotifierProvider(
                            create: (context) => LoginProvider(),
                            child: const LoginScreen(),
                          )
                          : const LayoutView()),
        );
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case Routes.favoritesView:
        return MaterialPageRoute(
          builder:
              (context) => ChangeNotifierProvider(
                create: (context) => FavouritesProvider()..getFavourite(),
                child: const FavouritesScreen(),
              ),
        );
      case Routes.layoutView:
        return MaterialPageRoute(builder: (context) => const LayoutView());
      case Routes.loginView:
        return MaterialPageRoute(
          builder:
              (_) => ChangeNotifierProvider(
                create: (context) => LoginProvider(),
                child: const LoginScreen(),
              ),
        );
      case Routes.registerView:
        return MaterialPageRoute(
          builder:
              (_) => ChangeNotifierProvider(
                create: (context) => RegisterProvider(),
                child: const ResisterScreen(),
              ),
        );
      case Routes.homeView:
        return MaterialPageRoute(
          builder:
              (context) => ChangeNotifierProvider(
                create:
                    (context) =>
                        HomeProvider(getIt.get<HomeRepo>())
                          ..getTopMovies()
                          ..getMostPopularMovies(),
              ),
        );
      case Routes.languageView:
        return MaterialPageRoute(builder: (context) => const LanguageView());
      case Routes.accountEditingView:
        return MaterialPageRoute(
          builder:
              (context) => ChangeNotifierProvider<AccountEditingProvider>(
                create: (context) => AccountEditingProvider()..getUserData(),
                child: const AccountEditingView(),
              ),
        );
      case Routes.changePassView:
        return MaterialPageRoute(
          builder:
              (context) => ChangeNotifierProvider<AccountEditingProvider>(
                create: (context) => AccountEditingProvider()..getUserData(),
                child: const ChangePassView(),
              ),
        );
      case Routes.themeView:
        return MaterialPageRoute(builder: (context) => const ThemeView());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
