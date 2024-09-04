class Product {
  final String imageAsset;
  final String? title;
  final double? price;
  final String? description; // Add this field

  Product({
    required this.imageAsset,
    this.title,
    this.price,
    this.description, // Add this field
  });

  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      imageAsset: data['imageAsset'],
      title: data['title'],
      price: data['price'].toDouble(),
    );
  }
}
