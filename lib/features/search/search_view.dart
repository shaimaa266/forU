
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/features/details/presentation/view/most_popular_datails_screen.dart';
import 'package:untitled1/features/home/presentation/manager/home_provider.dart';

import '../../core/helpers/spacing.dart';
import '../../core/shared/custom_movies_list_item.dart';
import '../../core/shared/custom_text_form_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Consumer<HomeProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                CustomTextFormField(
                  hintText: 'Search',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'you should enter you search word or letter';
                    }
                  },
                  suffixIcon: Icons.search_outlined,
                  controller: provider.searchController,
                  onChange: (value) {
                    provider.searchMoviesList.clear();
                    provider.getSearchMovies();
                  },
                ),
                provider.searchMoviesList.isEmpty
                    ? Padding(
                  padding:  EdgeInsets.symmetric(vertical:40.h),
                  child:  Text(     provider.searchController?.text == ''?'' :'No items found'),
                )
                    : ListView.separated(
                  separatorBuilder: (context, index) =>
                      verticalSpacer(20),
                  padding: EdgeInsets.only(top: 20.h),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.searchMoviesList.length,
                  itemBuilder: (context, index) => CustomMoviesListItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MostPopularMoviesDetailsScreen(
                            id: provider.searchMoviesList[index].id,
                            title: provider.searchMoviesList[index].title,
                          ),
                        ),
                      );
                    },
                    imageUrl: provider.searchMoviesList[index].bigImage,
                    title: provider.searchMoviesList[index].title,
                    rating: provider.searchMoviesList[index].rating,
                    sorting: provider.searchMoviesList[index].genre,
                    year: provider.searchMoviesList[index].year.toString(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}