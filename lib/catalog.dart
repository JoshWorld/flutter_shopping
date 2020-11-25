
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item.dart';

class MyCatalog extends StatefulWidget {
  @override
  _MyCatalogState createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니구니'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.archive),
            onPressed: () {
            },
          )
        ],
      ),
      body: ListView(
        children: _itemList
            .map((item) => _buildItem(item))
            .toList(),
      ),
    );
  }

  Widget _buildItem(Item item) {
    return Padding(
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(fontSize:  31.0),
        ),
        subtitle: Text('${item.price}'),
        trailing: IconButton(icon: Icon(Icons.check), onPressed: (){},
        ),
      ),
      padding: const EdgeInsets.all(8.0)
    );
  }
}