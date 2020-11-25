import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping/model/custom_color.dart';

class CartList extends ChangeNotifier{

  List<CustomColor> cartList=[];

  void addCart(CustomColor value) {
    cartList.add(value);
    notifyListeners();
  }

  void removeCart(CustomColor value) {
    cartList.remove(value);
    notifyListeners();
  }
}