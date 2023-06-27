import 'package:flutter/services.dart' as the_bandle;
import 'package:mini_ecom/models/sneaker_model.dart';

// this class faceed data from json file and return it to app
class Helper {
  //mail
  Future<List<SneakersModel>> getMailSneakers() async {
    final data =
        await the_bandle.rootBundle.loadString("assets/json/men_shoes.json");

    final mailList = sneakersModelFromJson(data);

    return mailList;
  }

  //femail
  Future<List<SneakersModel>> getFemailneakers() async {
    final data =
        await the_bandle.rootBundle.loadString("assets/json/women_shoes.json");

    final femailList = sneakersModelFromJson(data);

    return femailList;
  }

  //kids
  Future<List<SneakersModel>> getKidsSneakers() async {
    final data =
        await the_bandle.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = sneakersModelFromJson(data);

    return kidsList;
  }

  //single mail sneaker
  Future<SneakersModel> getMailSneakersById(String id) async {
    final data =
        await the_bandle.rootBundle.loadString("assets/json/men_shoes.json");

    final mailList = sneakersModelFromJson(data);

    final sneaker = mailList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  //single femail sneaker
  Future<SneakersModel> getFemailSneakersById(String id) async {
    final data =
        await the_bandle.rootBundle.loadString("assets/json/women_shoes.json");

    final femailList = sneakersModelFromJson(data);

    final sneaker = femailList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  //single kids sneaker
  Future<SneakersModel> getKidsSneakersById(String id) async {
    final data =
        await the_bandle.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = sneakersModelFromJson(data);

    final sneaker = kidsList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }
}
