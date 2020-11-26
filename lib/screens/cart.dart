import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping/models/cart_state.dart';
import 'package:flutter_shopping/models/catalog_state.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('CART'),
        ),
        body: Consumer(
          builder: (context, CatalogState catalogState, child) {
            return Consumer<CartState>(
                builder: (BuildContext context, CartState cartState, child) {
              print(cartState.price);
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartState.items.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(cartState.items[index]['title']),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            catalogState
                                .makeTrueAddable(cartState.items[index]['id']);
                            cartState.remove(cartState.items[index]);
                          },
                        ),
                      ),
                    ),
                  ),
                  Text('\$ ${cartState.price.toString()}',
                      style:
                          TextStyle(fontSize: 44, fontWeight: FontWeight.bold))
                ],
              );
            });
          },
        ),
        // body: Text('CART'),
      ),
    );
  }
}
