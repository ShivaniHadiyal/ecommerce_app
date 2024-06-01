// view/product_details_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/product_details_controller.dart';
import '../model/product_details_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductDetailsController controller = Get.find();

    return GetBuilder<ProductDetailsController>(
      builder: (controller) => FutureBuilder<ProductDetailsModel>(
          future: controller.productDetailsModel,
          builder: (context, snapshot) => snapshot.hasData
              ? Container(
            color: Colors.white,
            child: Column(
              children: [
                Text(snapshot.data?.image ?? ''),
              ],
            ),
          )
              : const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
