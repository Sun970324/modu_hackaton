class MenuModel {
  final String category;
  final String name;
  final String productStatus;
  final String description;
  final int priceSingle;
  final int priceSet;
  final String ingredients;
  final String allergyCaution;

  MenuModel({
    required this.category,
    required this.name,
    required this.productStatus,
    required this.description,
    required this.priceSingle,
    required this.priceSet,
    required this.ingredients,
    required this.allergyCaution,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      category: json['page_content']['category'],
      name: json['page_content']['name'],
      productStatus: json['page_content']['product_status'],
      description: json['page_content']['description'],
      priceSingle: int.parse(json['page_content']['price']['single']),
      priceSet: int.parse(json['page_content']['price']['set']),
      ingredients: json['page_content']['ingredients'],
      allergyCaution: json['page_content']['allergy_caution'],
    );
  }
}
