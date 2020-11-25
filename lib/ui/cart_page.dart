import 'package:flutter/material.dart';
import 'package:flutter_shopping/model/Item_model.dart';

class CartPage extends StatefulWidget {
  List<Item> items;

  CartPage(this.items);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int _sumPrice;
  @override
  void initState() {
    super.initState();
    setState(() {
  _sumPrice = widget.items.where((e) => e.check==false).map((e) => e.price).reduce((value, element) => value + element);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          // ListView(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('총 $_sumPrice 원 입니다.',textScaleFactor: 2,),
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Transform.scale(
                scale: 1.2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:24.0),
                    child: TextButton(onPressed: (){}, child: Text('구매하기',textScaleFactor: 1.5,)),
                  ),
                ),
              ),
              Transform.scale(
                scale: 1.2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:24.0),
                    child: TextButton(onPressed: (){}, child: Text('돌아가기',textScaleFactor: 1.5,)),
                  ),
                ),
              ),
            ],
          ),
        ],),
      ),
    );
  }
}
