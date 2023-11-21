import 'package:digital_hero/common/app_drawer.dart';
import 'package:digital_hero/constants/constansts.dart';
import 'package:digital_hero/features/home/controller/products_provider.dart';
import 'package:digital_hero/features/home/widgets/ProductCardWidget.dart';
import 'package:digital_hero/features/home/widgets/chip_widget.dart';
import 'package:digital_hero/features/home/widgets/commercialContianer.dart';
import 'package:digital_hero/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:digital_hero/theme/app_theme_provider.dart';

class HomeView extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Product>> productsList =
        ref.watch(productListProvider);

    return Scaffold(
      drawer: const App_Drawer(),
      appBar: AppBar(
        title: digitalHeroLogo,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                shoppingCartIcon,
                color: Theme.of(context).colorScheme.onPrimary,
              ))
        ],
      ),
      body: Column(
        children: [
          const CommercialContianer(),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                ChipWidget(label: 'All'),
                InkWell(
                    onTap: () {
                      print('tapped');
                    },
                    child: ChipWidget(label: 'PSN Games')),
                ChipWidget(label: 'Xbox Games'),
                ChipWidget(label: 'PC Games'),
                ChipWidget(label: 'Softwares'),
                ChipWidget(label: 'Subscriptions'),
                ChipWidget(label: 'Others'),
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
              return Container(
                padding: const EdgeInsets.all(4),
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ProductCardWidget(product: products[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}



/* Scaffold(
                  drawer: App_Drawer(),
                  appBar: AppBar(
                    title: digitalHeroLogo,
                    centerTitle: true,
                    actions: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            shoppingCartIcon,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ))
                    ],
                  ),
                  body: const HomeView(),
                ) */





/*Switch(
        value: ref.watch(appThemeProvider.notifier).isLight(),
        onChanged: (value) {
          ref.read(appThemeProvider.notifier).changeTheme();
        },
      ),
      */