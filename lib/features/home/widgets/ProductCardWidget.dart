import 'package:digital_hero/features/cart/controller/basket_provider.dart';
import 'package:digital_hero/features/home/controller/products_provider.dart';
import 'package:digital_hero/models/basket.dart';
import 'package:digital_hero/models/product.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_ecommerce/controllers/itembag_controller.dart';
// import 'package:flutter_ecommerce/controllers/product_controller.dart';
// import 'package:flutter_ecommerce/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gap/gap.dart';

// import '../constants/themes.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 2),
        ],
      ),
      margin: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 1,
              child: AspectRatio(
                aspectRatio: 3 / 4, // Adjust the aspect ratio as needed
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 214, 214, 214),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '${product.title}',
                // product[productIndex].title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${product.shortDisc}',
                // product[productIndex].shortDescription,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.price}\$',
                    // '\$${product[productIndex].price}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 12),
                  ),
                  IconButton(
                    onPressed: () {
                      ref
                          .read(basketProvider.notifier)
                          .addProductToBasket(product);
                      // ref.read(proudctNotifierProvider.notifier).isSelectItem(
                      //     product[productIndex].pid, productIndex);

                      // // Itemka ayuu ku darayaa baga
                      // if (product[productIndex].isSelected == false) {
                      //   ref.read(itemBagProvider.notifier).addNewItemBag(
                      //         ProductModel(
                      //             pid: product[productIndex].pid,
                      //             imgUrl: product[productIndex].imgUrl,
                      //             title: product[productIndex].title,
                      //             price: product[productIndex].price,
                      //             shortDescription:
                      //                 product[productIndex].shortDescription,
                      //             longDescription:
                      //                 product[productIndex].longDescription,
                      //             review: product[productIndex].review,
                      //             rating: product[productIndex].rating),
                      //       );
                      // } else {
                      //   ref
                      //       .read(itemBagProvider.notifier)
                      //       .removeItem(product[productIndex].pid);
                      // }
                    },
                    icon: Icon(
                      // product[productIndex].isSelected
                      //     ? Icons.check_circle
                      //     :
                      Icons.add_circle,
                      size: 30,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
