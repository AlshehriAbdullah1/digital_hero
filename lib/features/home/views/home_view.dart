import 'package:digital_hero/common/app_Bar.dart';
import 'package:digital_hero/common/app_drawer.dart';
import 'package:digital_hero/constants/constansts.dart';
import 'package:digital_hero/features/home/controller/products_provider.dart';
import 'package:digital_hero/features/home/widgets/ProductCardWidget.dart';
import 'package:digital_hero/features/home/widgets/chip_widget.dart';
import 'package:digital_hero/features/home/widgets/commercialContianer.dart';
import 'package:digital_hero/features/product/views/product_view.dart';
import 'package:digital_hero/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:digital_hero/theme/app_theme_provider.dart';

// ignore: must_be_immutable
class HomeView extends ConsumerStatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => HomeView(),
      );
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  String selectedFilter = 'All';

  void changeFilter(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Product>> productsList =
        ref.watch(productListProvider);
    return Scaffold(
      drawer: const App_Drawer(),
      appBar: CustomAppBar(),
      body: Column(
        children: [
          const CommercialContianer(),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                InkWell(
                  onTap: () {
                    changeFilter('All');
                    // ref.read(selectedFilterProvider.notifier).setFilter('All');
                  },
                  child: const ChipWidget(label: 'All'),
                ),
                InkWell(
                    onTap: () {
                      changeFilter('PSN Games');
                    },
                    child: const ChipWidget(label: 'PSN Games')),
                InkWell(
                    onTap: () {
                      changeFilter('Xbox Games');
                    },
                    child: const ChipWidget(label: 'Xbox Games')),
                InkWell(
                    onTap: () {
                      changeFilter('PC Games');
                    },
                    child: const ChipWidget(label: 'PC Games')),
                InkWell(
                    onTap: () {
                      changeFilter('Softwares');
                    },
                    child: const ChipWidget(label: 'Softwares')),
                InkWell(
                    onTap: () {
                      changeFilter('Subscriptions');
                    },
                    child: const ChipWidget(label: 'Subscriptions')),
                InkWell(
                    onTap: () {
                      changeFilter('Others');
                    },
                    child: const ChipWidget(label: 'Others')),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hot Sales',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text(
                  'See all',
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ],
            ),
          ),
          productsList.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
            data: (products) {
              if (products.isEmpty) {
                return const Center(
                  child: Text('No products available'),
                );
              }
              List<Product> filteredProducts = [];

              // Filter products based on selected filter
              if (selectedFilter == 'All') {
                filteredProducts = products;
              } else {
                filteredProducts = products
                    .where((product) => product.category == selectedFilter)
                    .toList();
              }

              if (filteredProducts.isEmpty) {
                return const Center(child: Text('No products available'));
              }

              return Expanded(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  width: double.infinity,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemCount: filteredProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                ProductView.route(filteredProducts[index]));
                          },
                          child: ProductCardWidget(
                              product: filteredProducts[index]));
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
