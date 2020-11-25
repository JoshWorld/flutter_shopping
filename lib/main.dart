import 'package:flutter/material.dart';
import 'package:flutter_shopping/model/cart_list.dart';
import 'package:flutter_shopping/ui/shop_page.dart';
import 'package:provider/provider.dart';

import 'model/custom_color.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => CartList(),
        child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
              title: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ShopPage());
  }
}
