import 'package:flutter/material.dart';
import 'package:flutter_shopping/models/cart_state.dart';
import 'package:flutter_shopping/models/catalog_state.dart';
import 'package:flutter_shopping/screens/catalog.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CatalogState>.value(value: CatalogState()),
    ChangeNotifierProvider<CartState>.value(value: CartState())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Catalog());
  }
}
