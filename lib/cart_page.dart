import 'package:flutter/material.dart';

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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCartItem(),
          _buildCartItem(),
          _buildCartItem(),
          _buildCartItem(),
          _buildCartItem(),
          _buildCartItem(),
          _buildCartItem(),
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
                  '55,000￦',
                  style: TextStyle(fontSize: 28),
                ),
                FlatButton(
                  child: Text(
                    "Buy",
                    style: TextStyle(fontSize: 28, color: Colors.green[600]),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCartItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            color: Colors.yellow,
          ),
          Text('아이템이름'),
          Text('아이템가격'),
        ],
      ),
    );
  }
}
