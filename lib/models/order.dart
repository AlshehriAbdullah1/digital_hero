class Order {
  final String orderId;
  final String userId;
  final List<OrderProduct> products;
  final double totalAmount;
  final String orderStatus;

  Order({
    required this.orderId,
    required this.userId,
    required this.products,
    required this.totalAmount,
    required this.orderStatus,
  });
}

class OrderProduct {
  final String productId;
  final String name;
  final int quantity;
  final double price;

  OrderProduct({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
  });
}
