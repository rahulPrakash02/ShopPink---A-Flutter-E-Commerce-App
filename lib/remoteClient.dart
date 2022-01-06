import 'package:http/http.dart' as http;

import 'ProductModel.dart';

class HttpService {
  //HTTP Client Class

  static Future<List<ProductModel>> fetchproducts() async {
    //static method to make client constant.

    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    //response from the internet using http get mechanism

    if (response.statusCode == 200) {
      var data = response.body;
      return productModelFromJson(data);
    }
    //success case

    else {
      throw Exception("Error");
    }
    //failure case
  }
}
