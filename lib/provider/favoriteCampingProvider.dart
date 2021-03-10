import 'package:my_camping/models/camping.dart';
import 'package:my_camping/services/favoriteService.dart';
import 'package:flutter/material.dart';

class FavoriteCampingProvider extends ChangeNotifier {
  List<Camping> _favoriteCampings;

  List<Camping> get favoriteCampings => _favoriteCampings;

  void loadfavoriteCamping() async {
    _favoriteCampings = await FavoriteService.getFavoriteList();

    notifyListeners();
  }
}
