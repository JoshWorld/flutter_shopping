import 'package:flutter/material.dart';
import 'file:///C:/mobile/ssac_flutter/flutter_shopping/lib/cart_item.dart';
import 'package:flutter_shopping/model/shopping_item.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    final cart = Provider.of<CartItem>(context);
    return CustomScrollView(
      slivers: [
        SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => _buildCartItem(cart.cartItems[index]),
                childCount: cart.cartItems.length),

        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '합계',
                      style: TextStyle(fontSize: 28),
                    ),
                    Text(
                      '${NumberFormat("###,###,###").format(cart.totalPrice)}원',
                      style: TextStyle(fontSize: 28),
                    ),
                    FlatButton(
                      child: Text(
                        "Remove All",
                        style: TextStyle(fontSize: 28, color: Colors.green[600]),
                      ),
                      onPressed: () {
                        cart.removeAll();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
  String numberWithComma(int param) {
    return NumberFormat('###,###,###,###').format(param);
  }
  Widget _buildCartItem(ShoppingItem item) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            width: 60,
            child: Image.network(item.url, fit: BoxFit.cover,),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right:15.0),
              child: Text(
                item.title.replaceAll('<b>', '').replaceAll('</b>', ''),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Text('${numberWithComma(int.parse(item.price))}원'),
        ],
      ),
    );
  }
}
