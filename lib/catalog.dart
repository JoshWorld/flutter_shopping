import 'package:flutter/material.dart';
import 'package:flutter_shopping/model/item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shopping/main.dart';
import 'package:flutter_shopping/cart.dart';



class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}



class _CatalogState extends State<Catalog> {


  final List<Item> _items = [
    Item("Yellow_pencil"), //, color: Colors.red),
    Item("Yellow_bag"), //, color : Colors.orange),
    Item("Yellow_shoes") //, color : Colors.pink),
  ];
  bool _hasBeenPressed = false;
  List<bool> _list = [false, false, false];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.yellow,
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(left:50,top: 40, bottom: 20),
            child: Text(
              "Cartalog",
              style:
                  TextStyle(fontFamily: "Cooper Black BT", color: Colors.black
                  ,fontSize: 25),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top:30 , bottom: 50),
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                }),
          )
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
          itemCount : 3,
          itemBuilder: (BuildContext context, int index){
            return _itemlistTile( context, _items[index], index);

          })


    );
  }







  Widget _itemlistTile(context, Item item, int index) {
    //var action = Provider.of<Action>(context);
    String name = item.name;

    return ListTile(
      //_list.add(False),
      title: Row(
        children: [

            Container(
              width: 40,
              height: 40,
              color: Colors.yellow,
            ),

            Row(
              children: [
                Container(
                  width: 255,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                    child:
                      Text(name,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: "Roboto-Regular",
                            fontSize: 18,

                          )),

                  ),
                ),
                Column(

                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          //action.add(name);/////////////
                          setState(() {
                            _list[index] = !_list[index];
                          });
                        },
                        child: _list[index] ? Icon(Icons.check) : Text("ADD",
                            style: TextStyle(
                              fontFamily: "NotoSansKR-Thin",
                              color: Colors.black87,
                            )))
                  ],
                )
              ],
            ),
          //),
        ],
      ),
    );
  }
}
