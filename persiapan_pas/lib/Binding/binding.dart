import 'package:get/get.dart';
import 'package:persiapan_pas/controller/favorite_controller.dart';
import 'package:persiapan_pas/controller/profile_controller.dart';
import 'package:persiapan_pas/menus/anime/animeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeController>(() => AnimeController());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
// ohh jadi fungsinya binding adalah agar dapat menggunakan controller nya berulang kali tanpa harus membuat manual lagi setiap dipanggil
