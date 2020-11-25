import 'package:flutter/cupertino.dart';

class CatalogState with ChangeNotifier {
  List<Map<String, dynamic>> _items = [
    {"id": 1, "title": "아이폰", "price": 444, "addable": true},
    {"id": 2, "title": "갤럭시", "price": 333, "addable": true},
    {"id": 3, "title": "Google폰", "price": 424, "addable": true},
    {"id": 4, "title": "샤오미폰", "price": 22, "addable": true},
  ];

  void makeTrueAddable(int id) {
    _items[_items.indexWhere((item) => item['id'] == id)]['addable'] = true;
    notifyListeners();
  }

  void makeFalseAddable(int id) {
    _items[_items.indexWhere((item) => item['id'] == id)]['addable'] = false;
    notifyListeners();
  }

  List<Map> get items => _items;
}
