
import 'api_service.dart';
import '../model/product_model.dart';

class ProductRepository {
  ApiService apiService;
  ProductRepository(this.apiService);



  Future<ProductModel> getProductList() async {
    ProductModel productListModel = await apiService.getProductList();
    return productListModel;
  }


}
