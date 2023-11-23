import 'package:digital_hero/features/cart/controller/basket_provider.dart';
import 'package:digital_hero/models/basket.dart';
import 'package:digital_hero/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToCartBtn extends ConsumerWidget {
  final Product product;
  const AddToCartBtn({required this.product, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              backgroundColor: Theme.of(context).colorScheme.secondary),
          onPressed: () {
            ref.read(basketProvider.notifier).addProductToBasket(product);
          },
          child: Text(
            'Add Item to cart',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                fontSize: 22,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ),
    );
  }
}
