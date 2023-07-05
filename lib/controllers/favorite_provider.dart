import 'package:flutter/material.dart';

class FavoriteNotifire extends ChangeNotifier {
  bool _isFavorite = false;

  get isFavorite => _isFavorite;

  set isFavoirte(bool favorite) {
    _isFavorite = favorite;

    notifyListeners();
  }
}
