// api_service.dart
import 'dart:async';
import 'dart:convert';
import 'package:get/get_connect/connect.dart';
import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetConnect {
  ApiService() {
    super.timeout = const Duration(seconds: 60);
    $configureLifeCycle();
  }

  //get all products
  Future<ProductModel> getProductList() async {
    try {
      print("Attempting to fetch product list from API...");
      final response = await http.get(Uri.parse("https://fakestoreapi.com/products")).timeout(const Duration(seconds: 60));
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode != 200) {
        return Future.error('Something went wrong');
      } else {
        return ProductModel.fromJson(jsonDecode(response.body));
      }
    } catch (exception) {
      print("Error during API call: $exception");
      return Future.error(exception.toString());
    }
  }
}
