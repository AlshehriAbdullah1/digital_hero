// ignore_for_file: public_member_api_docs, sort_constructors_first
//this is mock data

class Product {
  String id = '';
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final String shortDisc;
  double rating;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.shortDisc,
    this.rating = 0.0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'],
      imageUrl: json['imageUrl'] ?? '',
      category: json['category'] ?? '',
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : json['rating'],
      shortDisc: json['shortDisc'] ?? '',
    );
  }
}
