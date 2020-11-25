import 'package:flutter/material.dart';
import 'package:flutter_shopping/model/Item_model.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Item> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = [
      Item('서비스_1', 10000),
      Item('서비스_1', 10000),
      Item('서비스_1', 10000),
      Item('서비스_1', 10000),
      Item('서비스_1', 10000),
      Item('서비스_1', 10000),
      Item('서비스_1', 10000),
      Item('서비스_1', 10000),
      Item('서비스_1', 10000),
      Item('서비스_1', 10000),
      Item('서비스_1', 10000),
      Item('서비스_1', 10000),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아이템 리스트'),
        actions: [
          Row(
            children: [
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){}),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(items.where((item) => item.check==true).length.toString()),
          )
            ],
          )   ,
        ],
      ),
      body: ListView(
          children: items
              .map((e) => ListTile(
                    title: Text(e.name),
                    subtitle: Text(e.toString()),
                  ))
              .toList()),
    );
  }
}
