// ignore_for_file: public_member_api_docs, sort_constructors_first
//this is mock data

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  double rating;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
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
    );
  }
}

// List<Product> productsList = [
//   Product(
//     title: 'Product1',
//     description: 'Lorem30',
//     price: 20.0,
//     imageUrl:
//         'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     id: '1',
//     category: 'Electronics',
//     rating: 0.0,
//   ),
//   Product(
//     title: 'Product1',
//     description: 'Lorem30',
//     price: 20.0,
//     imageUrl:
//         'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     id: '2',
//     category: 'Electronics',
//     rating: 0.0,
//   ),
//   Product(
//     title: 'Product1',
//     description: 'Lorem30',
//     price: 20.0,
//     imageUrl:
//         'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     id: '3',
//     category: 'Electronics',
//     rating: 0.0,
//   ),
//   Product(
//     title: 'Product1',
//     description: 'Lorem30',
//     price: 20.0,
//     imageUrl:
//         'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     id: '4',
//     category: 'Electronics',
//     rating: 0.0,
//   ),
//   Product(
//     title: 'Product1',
//     description: 'Lorem30',
//     price: 20.0,
//     imageUrl:
//         'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     id: '5',
//     category: 'Electronics',
//     rating: 0.0,
//   ),
//   Product(
//     title: 'Product1',
//     description: 'Lorem30',
//     price: 20.0,
//     imageUrl:
//         'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     id: '6',
//     category: 'Electronics',
//     rating: 0.0,
//   ),
//   Product(
//     title: 'Product1',
//     description: 'Lorem30',
//     price: 20.0,
//     imageUrl:
//         'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     id: '7',
//     category: 'Electronics',
//     rating: 0.0,
//   ),
//   Product(
//     title: 'Product1',
//     description: 'Lorem30',
//     price: 20.0,
//     imageUrl:
//         'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     id: '8',
//     category: 'Electronics',
//     rating: 0.0,
//   ),
//   Product(
//     title: 'Product1',
//     description: 'Lorem30',
//     price: 20.0,
//     imageUrl:
//         'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     id: '1',
//     category: 'Electronics',
//     rating: 0.0,
//   ),
//   Product(
//     title: 'Product1',
//     description: 'Lorem30',
//     price: 20.0,
//     imageUrl:
//         'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     id: '1',
//     category: 'Electronics',
//     rating: 0.0,
//   ),
// ];
