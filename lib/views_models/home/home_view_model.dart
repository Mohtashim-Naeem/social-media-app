import 'dart:convert';

import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/constants/images/app_images.dart';
import 'package:bloom_app/models/home_feeds/home_feeds_model.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:bloom_app/views/screens/categories/blooming/blooming_view.dart';
import 'package:bloom_app/views/screens/categories/books/books_view.dart';
import 'package:bloom_app/views/screens/categories/brittany/brittany_talks_view.dart';
import 'package:bloom_app/views/screens/categories/brittany_playlist/brittany_playlist_view.dart';
import 'package:bloom_app/views/screens/categories/daily_devo/daily_devo_view.dart';
import 'package:bloom_app/views/screens/categories/enrichment/enrichment_view.dart';
import 'package:bloom_app/views/screens/categories/super_boost/super_boost_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends GetxController {
  // int tabBarIndex = 0;
  List<HomePostFeedModel> postData = [];
  late bool unlock;
  bool isLike = false;
  List<Map> category = [
    {
      "name": "Daily Devo",
      "unlocked": true,
      "image": AppImages.dailyDevoCat,
    },
    {
      "name": "Super Boost",
      "unlocked": true,
      "image": AppImages.superBoostCat,
    },
    {
      "name": "Brittany Talks",
      "unlocked": false,
      "image": AppImages.brittanyTalkCat,
    },
    {
      "name": "Brittany's Playlist",
      "unlocked": false,
      "image": AppImages.brittanyPlaylistCat,
    },
    {
      "name": "Blooming",
      "unlocked": false,
      "image": AppImages.bloomingCat,
    },
    {
      "name": "Books of the Month",
      "unlocked": false,
      "image": AppImages.booksCat,
    },
    {
      "name": "Enrichment",
      "unlocked": false,
      "image": AppImages.enrichmentCat,
    },
  ];

  TextStyle selectedStyle =
      Fonts.noto(Get.context!, AppColors.raisinBlack, 12, FontWeight.w700);
  TextStyle unSelectedStyle =
      Fonts.noto(Get.context!, AppColors.raisinBlack, 12, FontWeight.w400);

  List<Widget> categoriesDestination = const [
    DailyDevoView(),
    SuperBoostView(),
    BrittanyTalksView(),
    BrittanyPlalistView(),
    BloomingView(),
    BooksView(),
    EnrichmentView(),
  ];
  // void setTabIndex(int v) {
  //   tabBarIndex = v;
  //   update();
  // }

  void getPost() async {
    String jsonData = await DefaultAssetBundle.of(Get.context!)
        .loadString("assets/dummy_data/home_feeds.json");
    var data = jsonDecode(jsonData);
    for (var value in data) {
      postData.add(HomePostFeedModel.fromJson(value));
    }
    update();
  }

  updateLikeStatus(int index) {
    bool newLikeStatus = isLike = !isLike;
    postData[index].like = newLikeStatus;
    update();
  }

  void getSubscriptionState() async {
    final pref = await SharedPreferences.getInstance();
    unlock = pref.getBool('unlock') ?? false;
  }

  @override
  void onInit() {
    super.onInit();
    getPost();
    getSubscriptionState();
  }
}
