
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/core/helpers/local_storage.dart';
import 'package:untitled1/features/favourite/data/model/fav_model.dart';

import '../../../../core/web_services/constants.dart';


class FavouritesProvider extends ChangeNotifier {
  List<Map<String, Object?>>? favouritesList;

  List<String> favouritesTitle = [];

  Future<void> getFavourite() async {
    final db = await DataBaseHelper().db;
    await db!.query(
      'favourites',
      where: 'email = ?',
      whereArgs: [email],
    ).then((value) {
      favouritesList = value;
      notifyListeners();
    }).catchError((e) {});
  }

  void insertFavourite({required FavouritesModel favouritesModel}) async {
    final myDb = await DataBaseHelper().db;
    final existingItems = await myDb?.query(
      'favourites',
      where: 'title = ? AND email = ?',
      whereArgs: [favouritesModel.title, email],
    );
    notifyListeners();
    if (existingItems!.isEmpty) {
      await DataBaseHelper()
          .insert(table: 'favourites', values: favouritesModel.toJson())
          .then((value) {
        favouritesTitle.add(favouritesModel.title);
        getFavourite();
        notifyListeners();
      }).catchError((e) {});
    } else {
      deleteFavourite(productTitle: favouritesModel.title);
      getFavourite();
      notifyListeners();
    }
  }

  void updateFavorite(productTitle, String isFavourite) async {
    Database? myDb = await DataBaseHelper().db;
    await myDb?.update(
      'favourites',
      {'isFavourite': isFavourite},
      where: 'title = ? AND email = ?',
      whereArgs: [productTitle, email],
    );
    getFavourite();
    notifyListeners();
  }

  void deleteFavourite({
    required String productTitle,
  }) async {
    Database? myDb = await DataBaseHelper().db;
    updateFavorite(productTitle, 'false');
    await myDb?.delete(
      'favourites',
      where: 'title = ? AND email = ?',
      whereArgs: [productTitle, email],
    ).then((value) {
      favouritesTitle.remove(productTitle);
      getFavourite();
      notifyListeners();
    }).catchError((e) {});
    notifyListeners();
  }

  bool isFavoriteProduct(title) {
    final isFavorite =
        favouritesList?.any((item) => item["title"]== title,) ?? false;
    return isFavorite;
  }
}