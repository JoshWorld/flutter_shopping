import 'package:flutter/material.dart';
import 'package:flutter_shopping/cart_page.dart';

class ItemListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        childAspectRatio: 1.0,
        children: [
          _buildShoppingItem(),
          _buildShoppingItem(),
          _buildShoppingItem(),
          _buildShoppingItem(),
          _buildShoppingItem(),
          _buildShoppingItem(),
          _buildShoppingItem(),
        ],
      ),
    );
  }

  Widget _buildShoppingItem() {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.yellow,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('아이템이름'),
        ),
      ],
    );
  }
}
