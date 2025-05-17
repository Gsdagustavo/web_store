class CartItem {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final double total;
  final String thumbnail;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.thumbnail,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
      thumbnail: json['thumbnail'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          price == other.price &&
          quantity == other.quantity &&
          total == other.total &&
          thumbnail == other.thumbnail;

  @override
  int get hashCode => Object.hash(id, title, price, quantity, total, thumbnail);

  @override
  String toString() {
    return 'CartItem{id: $id, title: $title, price: $price, quantity: $quantity, total: $total, thumbnail: $thumbnail}';
  }
}
