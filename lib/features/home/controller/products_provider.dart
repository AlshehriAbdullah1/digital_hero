import 'dart:convert';
import 'dart:typed_data';

import 'package:digital_hero/models/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:digital_hero/models/product.dart'; // Import your Product model

final productListProvider = FutureProvider<List<Product>>((ref) async {
  try {
    // Access the 'products' collection in Firestore
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('products').get();

    List<Product> products = [];

    // Iterate through each document in the collection
    for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
      // Parse the data from the document into a Product object
      Product product = Product.fromJson(doc.data());
      products.add(product);
    }

    return products;
  } catch (e) {
    print('Error fetching products: $e');
    return []; // Return an empty list or handle the error appropriately
  }
});

Product productFromJson(Map<String, dynamic> json) {
  // Convert JSON to Product object
  return Product.fromJson(json);
}
