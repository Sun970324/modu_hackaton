class CartItemModel {
  final String productName;
  final int singlePrice;
  final int setPrice;
  int quantity;

  CartItemModel({
    required this.productName,
    required this.singlePrice,
    required this.setPrice,
    this.quantity = 1,
  });

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
