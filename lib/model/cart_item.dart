import 'package:flutter/material.dart';
import 'package:flutter_shopping/model/shopping_item.dart';

class CartItem extends ChangeNotifier {
  final List<ShoppingItem> _cartItems = [];
  int totalPrice = 0;

  List<ShoppingItem> get cartItems => _cartItems;


  void add(ShoppingItem item) {
    _cartItems.add(item);
    totalPrice += int.parse(item.price);
    notifyListeners();
  }

  void remove(ShoppingItem item) {
    totalPrice -= int.parse(item.price);
    _cartItems.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _cartItems.clear();
    totalPrice = 0;
    notifyListeners();
  }
}