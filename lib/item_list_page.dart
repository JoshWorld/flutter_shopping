import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/cart_page.dart';
import 'package:flutter_shopping/http/shopping_repository.dart';
import 'package:flutter_shopping/model/cart_item.dart';
import 'package:flutter_shopping/model/shopping_item.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List<ShoppingItem> result = [];
  List<ShoppingItem> items = [];

  @override
  void initState() {
    super.initState();

    _fetchShoppingItemList();
  }

  Future<void> _fetchShoppingItemList() async {
    result = await ShoppingRepository().fetchShoppingItemList();
    setState(() {
      items = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItem>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          'Shopping',
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          IconButton(
              color: Colors.black87,
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              })
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 0.7,
          children: items.map((item) => _buildShoppingItem(item)).toList(),
        ));
  }

  String numberWithComma(int param) {
    return NumberFormat('###,###,###,###').format(param);
  }

  Widget _buildShoppingItem(ShoppingItem item) {
    final cart = Provider.of<CartItem>(context);
    if (cart.totalPrice == 0) {
      item.isChecked = 0;
    }
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          child: InkWell(
            child: Stack(children: [
              Center(
                child: Image.network(
                  item.url,
                  fit: BoxFit.cover,
                  color: item.isChecked == 1 ? Colors.black38 : null,
                  colorBlendMode: item.isChecked == 1 ? BlendMode.darken : null,
                ),
              ),
              Center(
                  child: item.isChecked == 1
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : null),
            ]),
            onTap: () {
              if (item.isChecked != 1) {
                item.isChecked = 1;
                setState(() {
                  cart.add(item);
                });
              } else {
                item.isChecked = 0;
                setState(() {
                  cart.remove(item);
                });
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item.title.replaceAll('<b>', '').replaceAll('</b>', ''),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
              '${NumberFormat('###,###,###,###').format(int.parse(item.price))}원'),
        )
      ],
    );
  }
}
