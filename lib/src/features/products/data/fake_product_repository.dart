import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/product.dart';

class FakeProductRepository {
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

final productRepositoryProvider = Provider<FakeProductRepository>((ref) {
  return FakeProductRepository();
});
