class CartItem {
  int id;
  String title;
  double price;
  int quantity;
  String thumbnail;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.thumbnail,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      thumbnail: json['thumbnail'],
    );
  }

  double get total => price * quantity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          price == other.price &&
          quantity == other.quantity &&
          thumbnail == other.thumbnail;

  @override
  int get hashCode => Object.hash(id, title, price, quantity, thumbnail);

  @override
  String toString() {
    return 'CartItem{id: $id, title: $title, price: $price, quantity: $quantity, thumbnail: $thumbnail}';
  }
}
