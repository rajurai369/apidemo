
import 'package:ecommerce/controller/single_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class SingleProductView extends StatefulWidget {
  const SingleProductView({super.key});

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  int qyt = 1;
  @override
  Widget build(BuildContext context) {
    var spController = Get.find<SingleProductController>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(child: Text("Details Good",style: TextStyle(color: Colors.white),)),),
      
      body: Obx(() {
        if (spController.isloading.value == true) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.size.width,
                      height: 250,
                      child: Card(
                          child: Image.network(
                              "${spController.product.value.image}")),
                    ),
                    Text(
                      "${spController.product.value.title}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${spController.product.value.price}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        RatingBar.builder(
                          initialRating: double.parse(spController
                              .product.value.rating!.rate
                              .toString()),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      ],
                    ),
                    Text(
                      "${spController.product.value.description}",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                  
                                    if (qyt <= 1) {
                                      qyt = 1;
                                    } else {
                                      qyt--;
                                    }
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    size: 40,
                                  )),
                              SizedBox(
                                  width: 50,
                                  child: Text(
                                    "$qyt",
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    qyt++;
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    size: 40,
                                  )),
                            ],
                          ),
                        ),
                        MaterialButton(
                            color: Colors.amber,
                            
                            
                            onPressed: () {},
                            child:  const Text("Add to cart",style:TextStyle(color: Colors.white),))
                      ],
                    ),
                  ]),
            ),
          );
        }
      }),
    ));
  }
}
