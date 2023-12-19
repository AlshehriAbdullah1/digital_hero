import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_hero/models/order.dart' as order_model;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> placeOrder(order_model.Order order) async {
    try {
      // Convert products to a format suitable for Firestore
      final List<Map<String, dynamic>> formattedProducts = order.products
          .map((product) => {
                'productId': product.productId,
                'name': product.name,
                'quantity': product.quantity,
                'price': product.price,
              })
          .toList();

      // Add the order to Firestore
      await _firestore.collection('orders').add({
        'orderId': order.orderId,
        'userId': order.userId,
        'products': formattedProducts,
        'totalAmount': order.totalAmount,
        'orderStatus': order.orderStatus,
      });
    } catch (e) {
      print('Error placing order: $e');
      // Optionally, show an error message to the user
    }
  }
}

final orderNotifierProvider = Provider<OrderNotifier>((ref) {
  return OrderNotifier();
});
