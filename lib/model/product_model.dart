// model/product_model.dart

class ProductModel {
  final List<Product> products;

  ProductModel({required this.products});

  factory ProductModel.fromJson(List<dynamic> json) {
    return ProductModel(
      products: json.map((data) => Product.fromJson(data)).toList(),
    );
  }
}

class Product {
  final int id;
  final String title;
  final String description;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
    );
  }
}
