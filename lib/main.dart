import 'package:flutter/material.dart';
import 'package:flutter_shopping/model/Item_model.dart';
import 'package:flutter_shopping/ui/itemList_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    //멀티프로바이더 구현
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Item()),
    ],
    child: MyApp(),)
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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ItemList(),
    );
  }
}



