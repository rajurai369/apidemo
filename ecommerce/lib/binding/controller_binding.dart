import 'package:ecommerce/controller/category_controller.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../controller/single_product_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
    Get.put(ProductController());
    Get.put(SingleProductController());

  }
}
