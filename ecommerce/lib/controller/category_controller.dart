import 'package:get/get.dart';

import '../services/remote_service.dart';

class CategoryController extends GetxController {
  var categories = [].obs;
  var isloading = false.obs;

  Future getCategories() async {
    try {
      isloading(true);
      var data = await RemoteService.fetchCategories();
      if (data != null) {
        categories.value = data;
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    } finally {
      isloading(false);
    }
  }

  @override
  void onInit() {
    //
    super.onInit();
    getCategories();
  }
}


