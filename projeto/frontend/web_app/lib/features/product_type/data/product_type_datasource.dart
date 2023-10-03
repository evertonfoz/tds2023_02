import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_app/features/shared/models/product_type.dart';

class ProductTypeDataSource {
  Future<List<ProductTypeModel>> fetchProductTypes() async {
    final response =
        await http.get(Uri.parse('http://localhost:5004/api/productTypes'));

    if (response.statusCode == 200) {
      return _mapResponseToModel(response);
    } else {
      throw Exception('Failed to load product types');
    }
  }

  Future<ProductTypeModel?> postProductType({
    required String name,
  }) async {
    final response = await http.post(
      Uri.parse('http://localhost:5004/api/productTypes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'name': name,
      }),
    );

    if (response.statusCode == 201) {
      return ProductTypeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product types');
    }
  }

  List<ProductTypeModel> _mapResponseToModel(http.Response response) {
    final List<ProductTypeModel> productTypes = [];
    for (var productType in json.decode(response.body)) {
      productTypes.add(ProductTypeModel.fromJson(productType));
    }
    return productTypes;
  }
}
