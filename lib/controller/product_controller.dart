// controller/product_controller.dart

import 'package:get/get.dart';
import '../core/product_repositry.dart';
import '../model/product_model.dart';

class ProductController extends GetxController {
  final ProductRepository repository;
  var isJobDataProcessing = false.obs;
  var lstProduct = <Product>[].obs; // Updated to list of Product objects
  var isMoreDataAvailable = false.obs;

  ProductController(this.repository);

  void loadHomeData() async {
    try {
      isJobDataProcessing(true);
      final productListModel = await repository.getProductList();
      lstProduct.assignAll(productListModel.products); // Updated to assign the product list
    } catch (e) {
      // Handle error
      print('Error fetching product list: $e');
    } finally {
      isJobDataProcessing(false);
    }
  }
}
