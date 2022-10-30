import 'package:get/get.dart';

import '../services/remote_service.dart';

class ProductController extends GetxController {
  var products = [].obs;
  var isloading = false.obs;

  Future getProducts() async {
    try {
      isloading(true);
      var data = await RemoteService.fetchProduct();
      if (data != null) {
        products.value = data;
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
    getProducts();
  }
}
