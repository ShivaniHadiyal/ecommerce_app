// binding/product_details_binding.dart

import 'package:get/get.dart';
import 'package:e_commerce_flutter/controller/product_details_controller.dart';
import 'package:e_commerce_flutter/core/api_service.dart';
import 'package:e_commerce_flutter/core/product_repositry.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
          () => ProductDetailsController(
        ProductRepository(ApiService()),
      ),
    );
  }
}
