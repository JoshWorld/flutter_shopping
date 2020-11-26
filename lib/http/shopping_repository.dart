import 'dart:convert';
import 'package:flutter_shopping/model/shopping_item.dart';
import 'package:http/http.dart' as http;

class ShoppingRepository {
  Future<List<ShoppingItem>> fetchShoppingItemList() async {
    //await와 async는 한 셋트
    //await는 Future가 종료되는 것을 기다린다. async 키워드가 붙어있는 메서드 안에서만 사용 가능
    final http.Response response = await http.get(
        'https://openapi.naver.com/v1/search/shop.json?query=고양이사료&display=20&sort=sim',
        headers: {
          "X-Naver-Client-Id": "ufml1loOHBFln5m0yK2Z",
          "X-Naver-Client-Secret": "HL5l4L_ycM"
        });

    if (response.statusCode == 200) {
      //200 정상코드

      // //jsonDecode로 응답받은 값을 String에서 Map형태로 바꿔주는 것
      final Iterable json = jsonDecode(response.body)["items"];
      return json.map((e) => ShoppingItem.fromJson(e)).toList();
    } else {
      //에러가 나면 예외 발생시키고 종료
      throw Exception('Failed to load ShoppingItem');
    }
  }
}
