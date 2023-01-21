import 'dart:async';

import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:flutter/cupertino.dart';
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

  Future<List<Product>> fetchProductsList() async {
    await Future.delayed(const Duration(seconds: 2));
    // best use cases: REST API
    return Future.value(_products);
  }

  Stream<List<Product>> watchProductList() async* {
    await Future.delayed(const Duration(seconds: 2));

    // best use case: Real Time message / sockets /continuous data
    yield _products;
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

final productsListStreamProvider =
    StreamProvider.autoDispose<List<Product>>((ref) {
  debugPrint('created productListStreamProvider');
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.watchProductList();
});

final productsListFutureProvider =
    FutureProvider.autoDispose<List<Product>>((ref) {
  final productRepository = ref.watch(productRepositoryProvider);
  return productRepository.fetchProductsList();
});

final productProvider =
    StreamProvider.autoDispose.family<Product?, String>(((ref, id) {
  final productsRepository = ref.watch(productRepositoryProvider);
  return productsRepository.watchProduct(id);
}));
