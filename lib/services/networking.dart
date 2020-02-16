import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  final url;

  NetworkHelper(this.url);

  Future getData() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return convert.jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
