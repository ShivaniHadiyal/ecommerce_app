
import '../model/product_details_model.dart';
import 'api_service.dart';
import '../model/product_model.dart';

class ProductRepository {
  ApiService apiService;
  ProductRepository(this.apiService);



  Future<ProductModel> getProductList() async {
    ProductModel productListModel = await apiService.getProductList();
    return productListModel;
  }

  Future<ProductDetailsModel> getProductDetails(int id) async {
    // Replace this with your actual API call
    return await apiService.getProductDetails(id);
  }

}
