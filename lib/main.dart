import 'package:flutter/material.dart';
import 'package:carrito_de_compras_dlfb/common/theme.dart';
import 'package:carrito_de_compras_dlfb/models/cart.dart';
import 'package:carrito_de_compras_dlfb/models/catalog.dart';
import 'package:carrito_de_compras_dlfb/screens/cart.dart';
import 'package:carrito_de_compras_dlfb/screens/catalog.dart';
import 'package:carrito_de_compras_dlfb/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
              cart.catalog = catalog;
              return cart;
            },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const MyLogin(),
          '/catalog': (context) => const MyCatalog(),
          '/cart': (context) => const MyCart(),
        },
      ),
    );
  }
}
