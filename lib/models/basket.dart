import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model for a product in the basket
class BasketProduct {
  final String id;
  final String name;
  int quantity;
  final String shortDisc;
  final double price;

  BasketProduct({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.shortDisc,
  });
}

// Basket model to manage the list of products in the basket
class Basket {
  List<BasketProduct> products;

  Basket({required this.products});
}
