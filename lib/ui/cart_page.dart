import 'package:flutter/material.dart';
import 'package:flutter_shopping/model/custom_color.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CustomColor> cartList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니'),
      ),
      body: ListView(
        children: cartList.map((e) => _buildListTile(e)).toList(),
      ),
    );
  }

  Widget _buildListTile(CustomColor color) {
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        color: color.color,
      ),
      title: Text(color.name),
      trailing: InkWell(
        child: IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            setState(() {
              cartList.remove(color);
            });
          },
        ),
      ),
    );
  }
}
