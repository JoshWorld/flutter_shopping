import 'package:flutter_shopping/model/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping/catalog.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shopping/main.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var basketlist = Provider.of<Action>(context);

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Catalog()),
              );
            }),
        title: Padding(
          padding: EdgeInsets.only(left: 100, top: 40, bottom: 20),
          child: Text(
            "Cart",
            style: TextStyle(
                fontFamily: "Cooper Black BT",
                color: Colors.black,
                fontSize: 25),
          ),
        ),
      ),
      body: Column(children: [
        Container(
          height: 550,
          child: Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
              child: _buildcartitem(context, "yellow_pen")
              // for (var i in basketlist){
              //   Column(children: [
              //   _buildcartitem(context, i)]);}
              //////////////

              ),
        ),
        Divider(
          thickness: 5,
          color: Colors.black,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(children: [
                  Text(
                    "100",
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: "Cooper Black BT",
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Text("BUY"),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              //)),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildcartitem(context, name) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("· $name",
                style: TextStyle(fontFamily: "NotoSansKR-Thin", fontSize: 18))
          ],
        ));
  }
}
