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

  String appliedCouponCode = '';
  // Add a product to the basket
  void addProductToBasket(Product product) {
    print('adding product with id ${product.id}');
    if (_productIsInBasket(product.id)) {
      addProductQuantity(product.id);
    } else {
      BasketProduct newProduct = BasketProduct(
          id: product.id,
          name: product.title,
          price: product.price,
          shortDisc: product.shortDisc,
          imageUrl: product.imageUrl);
      state = Basket(products: [...state.products, newProduct]);
    }
  }

  void clearBasket() {
    state = Basket(products: []);
  }

  void addProductQuantity(String productId) {
    state = Basket(
        products: state.products.map((product) {
      if (product.id == productId) {
        product.quantity = product.quantity + 1;
      }
      return product;
    }).toList());
  }

  bool _productIsInBasket(String productId) {
    return state.products.any((product) => product.id == productId);
  }

  // Remove a product from the basket
  void removeProductFromBasket(BasketProduct product) {
    if (_productIsInBasket(product.id) && product.quantity > 1) {
      removeProductQuantity(product.id);
    } else {
      state = Basket(
          products: state.products
              .where((basketProduct) => basketProduct.id != product.id)
              .toList());
    }
  }

  void removeOrDecreaseProduct(Product product) {
    final productId = product.id;
    final productQuantity = getProductQuantity(productId);

    if (productQuantity > 1) {
      removeProductQuantity(productId);
    } else if (productQuantity == 1) {
      state = Basket(
        products: state.products
            .where((basketProduct) => basketProduct.id != productId)
            .toList(),
      );
    } else {
      return;
    }
  }

  void removeProductFromBasketById(String productId) {
    state = Basket(
        products: state.products
            .where((basketProduct) => basketProduct.id != productId)
            .toList());
  }
  // void removeProductQuantityById(String productId) {
  //   state = Basket(
  //       products: state.products
  //           .map((basketProduct) {
  //              if( basketProduct.id == productId){
  //               if(basketProduct.quantity==1 ){

  //               }
  //               else{
  //             basketProduct.quantity = basketProduct.quantity-1;}

  //           }

  //           return basketProduct  ;
  //           })
  //           .toList());
  // }

  void removeProductQuantity(String productId) {
    state = Basket(
        products: state.products.map((product) {
      if (product.id == productId) {
        product.quantity = product.quantity - 1;
      }
      return product;
    }).toList());
  }

  // Update quantity of a product in the basket
  void _updateProductQuantity(String productId, int newQuantity) {
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
    final discount = getDiscountAmount();
    return totalPrice - (discount * totalPrice);
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
      appliedCouponCode = couponCode;
      return 0.1;
    } else {
      appliedCouponCode = '';
      return 0;
    }
  }

  double getDiscountAmount() {
    if (appliedCouponCode == "DISCOUNT10") {
      //  appliedCouponCode = couponCode;
      return 0.1;
    } else {
      return 0;
    }
  }
}
