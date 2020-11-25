class Item{
  String name;
  num price;
  int count = 0;
  int mulit =1;
  bool check = false;


  Item(this.name, this.price);

  @override
  String toString() {
    return '$name 상품이 $price 원 이고 지금까지 $count개 팔렸습니다.';
  }
}