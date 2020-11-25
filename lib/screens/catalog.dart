import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping/models/cart_state.dart';
import 'package:flutter_shopping/models/catalog_state.dart';
import 'package:flutter_shopping/screens/cart.dart';
import 'package:provider/provider.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('CATALOG'),
          trailing: Material(
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Cart()));
                }),
          ),
        ),
        body: Consumer(
          builder: (context, CartState cartState, child) {
            return Consumer(
              builder: (context, CatalogState catalogState, child) {
                return ListView.builder(
                  itemCount: catalogState.items.length,
                  itemBuilder: (context, index) => ListTile(
                      title: Text(catalogState.items[index]['title']),
                      trailing: catalogState.items[index]['addable']
                          ? TextButton(
                              onPressed: () {
                                print(catalogState.items[index]);
                                catalogState.makeFalseAddable(
                                    catalogState.items[index]['id']);
                                cartState.add(catalogState.items[index]);
                                print(cartState.price);
                              },
                              child: Text('ADD'))
                          : Icon(Icons.check)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
