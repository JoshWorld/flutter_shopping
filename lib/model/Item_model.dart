class Item{
  String name;
  num price;
  int count = 0;
  bool check = false;

  Item(this.name, this.count);

  @override
  String toString() {
    return '$name 상품이 $num 원 이고 지금까지 $count팔렸습니다.';
  }
}