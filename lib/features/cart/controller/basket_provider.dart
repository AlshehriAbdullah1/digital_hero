// Provider to manage the basket state
import 'package:digital_hero/models/basket.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final basketProvider = StateNotifierProvider<BasketNotifier, Basket>((ref) {
  return BasketNotifier(Basket(products: []));
});

// Notifier class for the basket state
class BasketNotifier extends StateNotifier<Basket> {
  BasketNotifier(Basket state) : super(state);

  // Add a product to the basket
  void addProductToBasket(BasketProduct product) {
    print('adding item to basket');
    state = Basket(products: [...state.products, product]);
  }

  // Remove a product from the basket by ID
  void removeProductFromBasket(String productId) {
    state = Basket(
        products: state.products
            .where((product) => product.id != productId)
            .toList());
  }

  // Update quantity of a product in the basket
  void updateProductQuantity(String productId, int newQuantity) {
    state = Basket(
        products: state.products.map((product) {
      if (product.id == productId) {
        product.quantity = newQuantity;
      }
      return product;
    }).toList());
  }
}
