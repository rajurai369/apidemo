import 'package:ecommerce/model/single_product.dart';
import 'package:get/get.dart';

import '../services/remote_service.dart';

class SingleProductController extends GetxController {
  var product = SingleProductModel().obs;
  var isloading = false.obs;

  Future getProduct(int id) async {
    try {
      isloading(true);
      var data = await RemoteService.fetchSingleProduct(id);
      if (data != null) {
        product.value = data;
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    } finally {
      isloading(false);
    }
  }


}
