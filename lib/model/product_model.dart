/// Represents a product from DummyJson's products API
class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final int stock;
  final List<dynamic> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.stock,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      rating: json['rating'],
      stock: json['stock'],
      images: json['images'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'rating': rating,
      'stock': stock,
      'images': images,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          category == other.category &&
          price == other.price &&
          rating == other.rating &&
          stock == other.stock &&
          images == other.images;

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    category,
    price,
    rating,
    stock,
    images,
  );

  @override
  String toString() {
    return 'Product{id: $id, title: $title, description: $description, category: $category, price: $price, rating: $rating, stock: $stock, images: $images}';
  }
}
