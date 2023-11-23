// Provider to manage the basket state
import 'package:digital_hero/models/basket.dart';
import 'package:digital_hero/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final basketProvider = StateNotifierProvider<BasketNotifier, Basket>((ref) {
  return BasketNotifier(Basket(products: []));
});

// Notifier class for the basket state
class BasketNotifier extends StateNotifier<Basket> {
  BasketNotifier(Basket state) : super(state);

  // Add a product to the basket
  void addProductToBasket(BasketProduct product) {
    print('adding product with id ${product.id}');
    if (productIsInBasket(product.id)) {
      updateProductQuantity(product.id, product.quantity + 1);
    } else {
      state = Basket(products: [...state.products, product]);
    }
  }

  bool productIsInBasket(String productId) {
    return state.products.any((product) => product.id == productId);
  }

  // Remove a product from the basket by ID
  void removeProductFromBasket(BasketProduct product) {
    if (productIsInBasket(product.id) && product.quantity > 1) {
      updateProductQuantity(product.id, product.quantity - 1);
    } else {
      state = Basket(
          products: state.products
              .where((basketProduct) => basketProduct.id != product.id)
              .toList());
    }
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

  double getTotalPrice() {
    double totalPrice = 0;
    for (var product in state.products) {
      totalPrice += product.price * product.quantity;
    }
    return totalPrice;
  }

  int getProductQuantity(String productId) {
    for (var product in state.products) {
      if (product.id == productId) {
        return product.quantity;
      }
    }
    return 0;
  }

  double getProductPrice(String productId) {
    for (var product in state.products) {
      if (product.id == productId) {
        return product.price;
      }
    }
    return 0;
  }

  double applyCouponDiscount(String couponCode) {
    if (couponCode == "DISCOUNT10") {
      return 0.1;
    } else {
      return 0;
    }
  }
}
