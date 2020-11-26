import 'package:flutter/material.dart';

class Item with ChangeNotifier{
  String name;
  num price;
  int count = 0;
  int multi =1;
  bool check = false;



  void checked() {
    check =!check;
    //변경알림
    notifyListeners();
}

  @override
  String toString() {
    return '$name 상품이 $price 원 이고 지금까지 $count개 팔렸습니다.';
  }
}