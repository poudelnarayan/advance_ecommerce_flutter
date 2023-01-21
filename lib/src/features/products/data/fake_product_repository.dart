import 'package:ecommerce_app/src/constants/test_products.dart';

import '../domain/product.dart';

class FakeProductRepository {
  FakeProductRepository._(); // making the constructor private so that the class cant be instantiated outside of this file
  static FakeProductRepository instance = FakeProductRepository._();

  final List<Product> _products = kTestProducts;

  List<Product> getProductList() {
    return _products;
  }

  Product? getProduct(String id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<List<Product>> fetchProductsList() {
    // best use cases: REST API
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductList() {
    // best use case: Real Time message / sockets /continuous data
    return Stream.value(_products);
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductList().map((product) => product.firstWhere((product) =>
        product.id ==
        id)); // .map will be executed every time eatchProductList() changes a value
  }
}
