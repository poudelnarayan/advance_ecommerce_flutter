import 'package:ecommerce_app/src/features/account/account_screen.dart';
import 'package:ecommerce_app/src/features/orders_list/orders_list_screen.dart';
import 'package:ecommerce_app/src/features/shopping_cart/shopping_cart_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/products_list/products_list_screen.dart';

enum AppRoute { home, cart, orders, account, signIn }

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
          name: AppRoute.home.name,
          // builder: ((context, state) => const ShoppingCartScreen()), => this produces a back button on the page
          pageBuilder: ((context, state) => MaterialPage(
                // to make a full screen shopping cart
                key: state.pageKey,
                fullscreenDialog:
                    true, // => this build the cross button on a page
                child: const ShoppingCartScreen(),
              )),
        ),
        GoRoute(
          path: 'orders',
          name: AppRoute.orders.name,
          pageBuilder: ((context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const OrdersListScreen(),
              )),
        ),
        GoRoute(
          path: 'account',
          name: AppRoute.account.name,
          pageBuilder: ((context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const AccountScreen(),
              )),
        ),
        GoRoute(
          path: 'signIn',
          name: AppRoute.signIn.name,
          pageBuilder: ((context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const EmailPasswordSignInScreen(
                  formType: EmailPasswordSignInFormType.signIn,
                ),
              )),
        ),
      ],
    ),
  ],
);
