import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteNotifire extends ChangeNotifier {
  List<dynamic> _favorites = [];
  List<dynamic> _ids = [];

  List<dynamic> get favorites => _favorites;
  List<dynamic> get ids => _ids;

  set favorites(List<dynamic> newFavorites) {
    _ids = newFavorites;
    notifyListeners();
  }

  set ids(List<dynamic> newIds) {
    _ids = newIds;
    notifyListeners();
  }

  final _favBox = Hive.box('fav_box');
  getFavorite() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);

      return {'key': key, 'id': item['id']};
    }).toSet();

    _favorites = favData.toList();
    _ids = _favorites.map((item) => item['id']).toList();
  }

  List<dynamic> _favoriteList = [];
  List<dynamic> get favoriteList => _favoriteList;
  set favoriteList(List<dynamic> newFavorite) {
    _favoriteList = newFavorite;
    notifyListeners();
  }

  getAllData() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        'key': key,
        'id': item['id'],
        'name': item['name'],
        'category': item['category'],
        'price': item['price'],
        'imageUrl': item['imageUrl']
      };
    }).toList();
    favoriteList = favData.reversed.toList();
  }

  Future<void> createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
  }

  Future<void> deleteFav(int key) async {
    await _favBox.delete(key);
  }
}
