import 'dart:async';
import 'package:http/http.dart' as http;


class HomeDao{
  Future fetchHomeList() async {
    var url = "https://jsonplaceholder.typicode.com/users";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
            "(KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
      },
    );

    print("Response Status Code : ${response.statusCode}");
    print("Response body : ${response.body}");

    return response;
  }
}