import 'package:digital_hero/common/app_Bar.dart';
import 'package:digital_hero/features/cart/controller/basket_provider.dart';
import 'package:digital_hero/features/product/widgets/add_to_cart.dart';
import 'package:digital_hero/models/basket.dart';
import 'package:digital_hero/models/product.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductView extends ConsumerWidget {
  static route(Product product) => MaterialPageRoute(
        builder: (context) => ProductView(product: product),
      );
  ProductView({super.key, required this.product});
  final Product product;
  final Random random = Random();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productQuantity =
        ref.watch(basketProvider.notifier).getProductQuantity(product.id);
    final basket = ref.watch(basketProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        title: Text('Product details', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            color: const Color.fromARGB(255, 214, 214, 214),
            child: Image.network(product.imageUrl),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 24),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    RatingBar(
                      itemSize: 20,
                      initialRating: 1,
                      minRating: 1,
                      maxRating: 5,
                      allowHalfRating: true,
                      ratingWidget: RatingWidget(
                        empty: const Icon(
                          Icons.star_border,
                          color: Colors.amber,
                        ),
                        full: const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        half: const Icon(
                          Icons.star_half_sharp,
                          color: Colors.amber,
                        ),
                      ),
                      onRatingUpdate: (value) => null,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text('${random.nextInt(1000)} Ratings')
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  product.description,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price.toString()}\$',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 20),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            print('remove item clicked');
                            ref
                                .watch(basketProvider.notifier)
                                .removeOrDecreaseProduct(product);
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        Text(
                            '${ref.watch(basketProvider.notifier).getProductQuantity(product.id)}'),
                        IconButton(
                          onPressed: () {
                            print('add item clicked');
                            ref
                                .watch(basketProvider.notifier)
                                .addProductToBasket(product);
                          },
                          icon: const Icon(Icons.control_point),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    )
                  ],
                ),
                AddToCartBtn(product: product),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
