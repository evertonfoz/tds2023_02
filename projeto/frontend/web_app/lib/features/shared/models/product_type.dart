class ProductTypeModel {
  final int? productTypeID;
  final String? name;

  ProductTypeModel({
    required this.productTypeID,
    required this.name,
  });

  factory ProductTypeModel.fromJson(Map<String, dynamic> json) {
    return ProductTypeModel(
      productTypeID: json['productTypeID'],
      name: json['name'],
    );
  }
}
