// import 'package:digital_hero/models/order.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final orderListProvider = StateProvider<List<Order>>((ref) => []);

// final orderProvider = Provider.family<Order?, String>((ref, orderId) {
//   final orders = ref.watch(orderListProvider).state;
//   final order = orders.firstWhereOrNull((order) => order.orderId == orderId);
//   return order; // Returning nullable Order to handle scenarios where the order is not found
// });

// final addOrderProvider = Provider.family<void, Order>((ref, newOrder) {
//   ref.read(orderListProvider).state = [...ref.read(orderListProvider).state, newOrder];
// });
