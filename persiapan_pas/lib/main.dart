import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persiapan_pas/Binding/binding.dart';
import 'package:persiapan_pas/login/logView.dart';
import 'package:persiapan_pas/menus/anime/anime_api.dart';
import 'package:persiapan_pas/menus/favorite.dart';
import 'package:persiapan_pas/menus/profile.dart';
import 'package:persiapan_pas/register/PostView.dart' as register;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => register.PostView()),
        GetPage(name: '/login', page: () => LogView()),
        GetPage(
          name: '/anime',
          page: () => AnimeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/favorite',
          page: () => FavoritePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/profile',
          page: () => const Profile(),
          binding: HomeBinding(),
        ),
      ],
      initialRoute: '/',
      home: register.PostView(),
    );
  }
}
