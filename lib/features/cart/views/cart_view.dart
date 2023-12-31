import 'package:digital_hero/features/cart/controller/basket_provider.dart';
import 'package:digital_hero/features/cart/controller/orders_provider.dart';
import 'package:digital_hero/models/product.dart';
import 'package:flutter/material.dart';
import 'package:digital_hero/common/app_Bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:digital_hero/models/order.dart' as order_model;

final textControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});
final loadingProvider = StateProvider<bool>((ref) => false);

class CartView extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => CartView(),
      );
  CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _couponController = ref.watch(textControllerProvider);
    final basket = ref.watch(basketProvider);
    final loadingState = ref.watch(loadingProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        title: Text(
          'Product details',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: basket.products.length,
                itemBuilder: (context, index) {
                  final product = basket.products[index];

                  return Card(
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      width: double.infinity,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.network('${product.imageUrl}'),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    product.shortDisc,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${product.price}\$',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  ref
                                      .watch(basketProvider.notifier)
                                      .removeProductFromBasket(product);
                                },
                                icon: const Icon(Icons.remove_circle_outline),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Text('${product.quantity}'),
                              IconButton(
                                onPressed: () {
                                  ref
                                      .watch(basketProvider.notifier)
                                      .addProductQuantity(product.id);
                                },
                                icon: const Icon(Icons.control_point),
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(
                      thickness: 1,
                    ),
                    const Text(
                      'Have a coupon code? enter here',
                      style: TextStyle(
                        color: Color(0xff8D969F),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _couponController,
                              decoration: InputDecoration(
                                hintText: 'Enter code',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              String couponCode = _couponController.text.trim();
                              if (couponCode.isNotEmpty) {
                                ref
                                    .read(basketProvider.notifier)
                                    .applyCouponDiscount(
                                        couponCode.toUpperCase());
                              }
                            },
                            child: Text('Apply',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Free',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Discount:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${(ref.watch(basketProvider.notifier).getDiscountAmount()) * 100} \%',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Subtracted amount:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '- ${(ref.watch(basketProvider.notifier).getSubAmount())} \$',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            Text(
                              '${(ref.watch(basketProvider.notifier).getTotalPrice()).toStringAsFixed(2)} \$',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 5),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary),
                              onPressed: () async => [
                                loadingState
                                    ? null
                                    : () async {
                                        ref
                                            .read(loadingProvider.notifier)
                                            .state = true;

                                        // Simulate loading for 2-3 seconds
                                        await Future.delayed(
                                            const Duration(seconds: 2));

                                        //ordering logic
                                        // final order = order_model.Order(
                                        //   // Create an order instance with required parameters

                                        //   userId: 'your_user_id',
                                        //   products: [], // Add the products to the order here
                                        //   totalAmount:
                                        //       0.0, // Set the total amount
                                        //   orderStatus:
                                        //       'pending', // Set the initial status
                                        // );

                                        // try {
                                        //   // Place the order using the OrderNotifier
                                        //   await ref
                                        //       .read(orderNotifierProvider)
                                        //       .placeOrder(order);

                                        //   // Show a success message to the user
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(
                                        //     const SnackBar(
                                        //       content: Text(
                                        //           'Order placed successfully!'),
                                        //       duration: Duration(seconds: 2),
                                        //     ),
                                        //   );
                                        //   Navigator.of(context).pop();
                                        // } catch (e) {
                                        //   // Handle order placement failure
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(
                                        //     SnackBar(
                                        //       content:
                                        //           Text('Failed to place order!'),
                                        //       duration:
                                        //           const Duration(seconds: 2),
                                        //     ),
                                        //   );
                                        // } finally {
                                        //   // Update the loading state
                                        //   ref
                                        //       .read(loadingProvider.notifier)
                                        //       .state = false;
                                        // }
                                      },
                                await Future.delayed(
                                    const Duration(seconds: 2)),
                                ref.read(basketProvider.notifier).clearBasket(),
                                Navigator.pop(context),
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Order placed successfully!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                ),
                             
                              ],
                              child: Text(
                                'Continue To Checkout',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
