import 'package:ecommerce/model/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';
import '../model/single_product.dart';

class RemoteService {
  static var client = http.Client();

  static Future<List<String>?> fetchCategories() async {
    try {
      var response = await client
          .get(Uri.parse("https://fakestoreapi.com/products/categories"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return categoryModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }  
    return null;
  }

static Future<List<ProductModel>?> fetchProduct() async {
    try {
      var response =
          await client.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
    return null;
  }

  static Future<SingleProductModel?> fetchSingleProduct(int id) async {
    try {
      var response =
          await client.get(Uri.parse("https://fakestoreapi.com/products/$id"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return singleProductModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
    return null;
  }
}
