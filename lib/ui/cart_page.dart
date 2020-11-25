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
      _sumPrice = widget.items.where((e) => e.check == false).map((e) => e.price).reduce((value, element) => value + element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView(
                //items 는 전체 아이템 리스트
                children: widget.items
                    .where((e) => e.check == true)
                    .map((e) => Card(
                            child: ListTile(
                          title: Text(e.name),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  width: 32,
                                  child: TextField(
                                    // Item class 변수로 TextEditingController를 만들어야 되는지?
                                    onChanged: (count){
                                      setState(() {
                                        // String _temp = count.int.parse();
                                      });

                                    },
                                    controller: TextEditingController(text: e.mulit.toString()),
                                  )),
                              IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      e.mulit++;
                                    });
                                  }),
                              IconButton(
                                  icon: Icon(Icons.indeterminate_check_box_outlined),
                                  onPressed: () {
                                    setState(() {
                                      e.mulit--;
                                    });
                                  }),
                            ],
                          ),
                        )))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '총 $_sumPrice 원 입니다.',
                textScaleFactor: 2,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            '구매하기',
                            textScaleFactor: 1.5,
                          )),
                    ),
                  ),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            '돌아가기',
                            textScaleFactor: 1.5,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
