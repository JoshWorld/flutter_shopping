import 'package:flutter/material.dart';
import 'package:flutter_shopping/model/shopping_item.dart';

class CartItem extends ChangeNotifier {
  final List<ShoppingItem> _cartItems = [];
  int totalPrice = 0;

  //이 방식은 안의 내용 수정 가능(변경가능 리스트 mutable list)
  // List<ShoppingItem> get cartItems => _cartItems;

  //변경불가능 리스트 immutable list
  List<ShoppingItem> get cartItems => List.unmodifiable(_cartItems);

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