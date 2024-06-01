import 'package:get/get.dart';
import '../core/product_repositry.dart';
import '../model/product_details_model.dart';

class ProductDetailsController extends GetxController {
  final ProductRepository repository;
  var isDataProcessing = false.obs;

  // Initialize with a default value
  late Future<ProductDetailsModel> productDetailsModel = Future.value(ProductDetailsModel(
    id: 1,
    title: 'Product Title',
    description: 'Product Description',
    price: 19.99,
    category: 'Product Category',
    image: 'product_image.png',
    rating: Rating(rate: 1.2, count: 0), // Use a Rating object here
  ));

  var isMoreDataAvailable = false.obs;
  late int id;

  ProductDetailsController(this.repository);

  @override
  void onInit() {
    super.onInit();
    isDataProcessing(true);
    // Check if Get.arguments is not null and is of type Map
    if (Get.arguments != null && Get.arguments is Map) {
      // Access the 'id' property from Get.arguments
      id = Get.arguments['id'];
      productDetailsModel = repository.getProductDetails(id);
    } else {
      // Handle the case when Get.arguments is null or not a Map
      // You can set a default id or handle it as per your application logic
      id = 0; // Set a default id
      // You may want to show an error message or redirect to another page
    }
    isDataProcessing(false);
    update();
  }
}
