import 'package:flutter/material.dart';
import 'package:mini_ecom/models/sneaker_model.dart';
import 'package:mini_ecom/services/helper.dart';

class ProductNotifier extends ChangeNotifier {
  int _activePage = 0;
  int get activePage => _activePage;
  set activePage(int newIndex) {
    _activePage = newIndex;
    notifyListeners();
  }

  List<dynamic> _shoeSize = [];
  List<dynamic> get shoeSize => _shoeSize;
  set shoeSize(List<dynamic> newSize) {
    _shoeSize = newSize;
    notifyListeners();
  }

  void toggleCheck(int index) {
    for (int i = 0; i < _shoeSize.length; i++) {
      if (i == index) {
        _shoeSize[i]['isSelected'] = !_shoeSize[i]['isSelected'];
      }
    }
    notifyListeners();
  }

  List<String> _sizes = [];
  List<String> get sizes => _sizes;
  set sizes(List<String> sizes) {
    _sizes = sizes;
    notifyListeners();
  }

  late Future<List<SneakersModel>> male;
  late Future<List<SneakersModel>> female;
  late Future<List<SneakersModel>> kids;
  late Future<SneakersModel> sneakers;

  void getMale() {
    male = Helper().getMailSneakers();
  }

  void getFemale() {
    female = Helper().getFemailneakers();
  }

  void getKids() {
    kids = Helper().getKidsSneakers();
  }

  void getShoe(String category, String id) {
    if (category == "Men's Running") {
      sneakers = Helper().getMailSneakersById(id);
    } else if (category == "Women's Running") {
      sneakers = Helper().getFemailSneakersById(id);
    } else {
      sneakers = Helper().getKidsSneakersById(id);
    }
  }
}
