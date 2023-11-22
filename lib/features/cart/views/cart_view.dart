import 'package:digital_hero/features/cart/controller/basket_provider.dart';
import 'package:digital_hero/models/product.dart';
import 'package:flutter/material.dart';
import 'package:digital_hero/common/app_Bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => CartView(),
      );

  CartView({super.key});
  List<Map<String, dynamic>> itemBag = [
    {
      'title': 'Laptop',
      'shortDescription': 'HP 15s',
      'price': 500,
      'isSelected': false,
    },
    {
      'title': 'Smartphone',
      'shortDescription': 'iPhone 13',
      'price': 1200,
      'isSelected': false,
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basket = ref.watch(basketProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Orders',
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
                      color: Colors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.network(
                                'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'),
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
                                      color:
                                          Theme.of(context).colorScheme.primary,
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
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${product.price}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  print('remove item clicked');
                                  ref
                                      .watch(basketProvider.notifier)
                                      .updateProductQuantity(
                                          product.id, product.quantity - 1);
                                },
                                icon: const Icon(Icons.remove_circle_outline),
                              ),
                              Text('${product.quantity}'),
                              IconButton(
                                onPressed: () {
                                  print('add item clicked');
                                  ref
                                      .watch(basketProvider.notifier)
                                      .updateProductQuantity(
                                          product.id, product.quantity + 1);
                                },
                                icon: const Icon(Icons.control_point),
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
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Have a coupon code? enter here'),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 60, 244, 54),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'FDS2023',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: const Row(
                              children: [
                                Text(
                                  'Available',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 60, 244, 54),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Icon(Icons.check_circle)
                              ],
                            ),
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
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Free',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'No discount',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Divider(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 60, 244, 54),
                          ),
                        ),
                        Text(
                          '500',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 60, 244, 54),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
