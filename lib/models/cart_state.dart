import 'package:flutter/cupertino.dart';

class CartState extends ChangeNotifier {
  List<Map> _items = [];
  int _price = 0;

  void add(Map<String, dynamic> item) {
    _price += item['price'];
    _items.add(item);
    notifyListeners();
  }

  void remove(Map<String, dynamic> item) {
    _price -= item['price'];
    _items.remove(item);
    notifyListeners();
  }

  List<Map> get items => _items;
  int get price => _price;
}
