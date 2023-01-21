import 'package:ecommerce_app/src/features/shopping_cart/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/products_list/products_list_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: '/',
        builder: ((context, state) => const ProductsListScreen()),
        routes: [
          GoRoute(
            path: 'cart',
            // builder: ((context, state) => const ShoppingCartScreen()), => this produces a back button on the page
            pageBuilder: ((context, state) => MaterialPage(
                  // to make a full screen shopping cart
                  key: state.pageKey,
                  fullscreenDialog:
                      true, // => this build the cross button on a page
                  child: const ShoppingCartScreen(),
                )),
          ),
        ]),
  ],
);
