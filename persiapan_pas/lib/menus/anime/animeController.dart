import 'package:get/get.dart';
import 'animeModel.dart';
import 'animeService.dart';

class AnimeController extends GetxController {
  var isLoading = false.obs;
  var postList = <PostModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      var posts = await AnimeService.fetchPosts();
      postList.assignAll(posts);
    } catch (e) {
      print('Error while getting data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
