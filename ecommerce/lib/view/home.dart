import 'package:ecommerce/controller/category_controller.dart';
import 'package:ecommerce/view/single_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../controller/single_product_controller.dart';
import '../wigets/drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var cController = Get.find<CategoryController>();
    var pController = Get.find<ProductController>();
    var spController = Get.find<SingleProductController>();
    return SafeArea(
      child: Scaffold(
          drawer: const DrawerView(),
          appBar: AppBar(
              backgroundColor: Colors.amber, title: const Text("HomeView")),
          body: Obx(() {
            if (cController.isloading.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const ListTile(
                      title: Text("Categories"),
                    ),
                    SizedBox(
                      height: 40,
                      width: Get.size.width,
                      child: ListView.builder(
                          itemCount: cController.categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Chip(
                                  backgroundColor: Colors.amber,
                                  label: Text(
                                    cController.categories[index],
                                    style: const TextStyle(color: Colors.white),
                                  )),
                            );
                          }),
                    ),
                    const ListTile(
                      title: Text("Latest Product"),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: pController.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        var product = pController.products[index];
                        return InkWell(
                          onTap: () {
                            spController.getProduct(product.id);
                            Get.to(() => SingleProductView());
                          },
                          child: Card(
                            child: Stack(
                              children: [
                                Image.network(product.image),
                                Positioned(
                                    bottom: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          width: Get.size.width,
                                          decoration: const BoxDecoration(
                                            color: Colors.amber,
                                          ),
                                          child: Text(
                                            product.title,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          )),
                                    )),
                                Positioned(
                                    right: 10,
                                    child: Text(
                                      "\$${product.price}",
                                      style: const TextStyle(fontSize: 18),
                                    )),
                              ],
                            ),
                          ),
                        );

                        //  Card(child: Text(product.title));
                      },
                    ),
                  ],
                ),
              );
            }
          })),
    );
  }
}
