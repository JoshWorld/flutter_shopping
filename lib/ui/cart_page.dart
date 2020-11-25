import 'package:flutter/material.dart';
import 'file:///C:/Users/Joon/AndroidStudioProjects/git_clone/jhjoon95/flutter_shopping/lib/state/cart_list.dart';
import 'package:flutter_shopping/model/custom_color.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final colors = Provider.of<CartList>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니'),
      ),
      body: ListView(
        children:
            colors.cartList.map((e) => _buildListTile(colors, e)).toList(),
      ),
    );
  }

  Widget _buildListTile(colors, CustomColor color) {
    IconData iconData = Icons.check;
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        color: color.color,
      ),
      title: Text(color.name),
      trailing: InkWell(
        child: IconButton(
          icon: Icon(iconData),
          onPressed: () {
            colors.removeCart(color);
          },
        ),
      ),
    );
  }
}
