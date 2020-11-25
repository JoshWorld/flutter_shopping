import 'package:flutter/material.dart';
import 'file:///C:/Users/Joon/AndroidStudioProjects/git_clone/jhjoon95/flutter_shopping/lib/state/cart_list.dart';
import 'package:flutter_shopping/model/custom_color.dart';
import 'package:flutter_shopping/ui/cart_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<CustomColor> colorsList = [
    CustomColor(Colors.black, 'Black'),
    CustomColor(Colors.red, 'Red'),
    CustomColor(Colors.blue, 'Blue'),
    CustomColor(Colors.yellow, 'yellow'),
    CustomColor(Colors.orange, 'Orange'),
    CustomColor(Colors.cyan, 'Cyan'),
    CustomColor(Colors.purple, 'Purple'),
    CustomColor(Colors.white, 'White')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('컬러 리스트'),
        leading: IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
        ),
      ),
      body: ListView(
        children: colorsList.map((e) => _buildListTile(e)).toList(),
      ),
    );
  }

//color
  Widget _buildListTile(CustomColor color) {
    final colors = Provider.of<CartList>(context); //이부분
    IconData iconData =
        colors.cartList.contains(color) ? Icons.check : Icons.add_shopping_cart;
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
            colors.addCart(color);
          },
        ),
      ),
    );
  }
}
