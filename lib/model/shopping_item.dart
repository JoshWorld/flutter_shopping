class ShoppingItem {
  String title;
  String url;
  String price;
  String productId;
  int isChecked;

  ShoppingItem(
      {this.title, this.url, this.price, this.productId, this.isChecked});

  ShoppingItem.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    url = json["image"];
    price = json["lprice"];
    productId = json["productId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["title"] = title;
    map["image"] = url;
    map["lprice"] = price;
    map["productId"] = productId;
    return map;
  }
}
