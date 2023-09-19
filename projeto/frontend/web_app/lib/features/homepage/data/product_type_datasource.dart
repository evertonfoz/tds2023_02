import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductTypeDataSource {
  Future<List<dynamic>> fetchProductTypes() async {
    final response =
        await http.get(Uri.parse('http://localhost:5004/api/productTypes'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load product types');
    }
  }
}
