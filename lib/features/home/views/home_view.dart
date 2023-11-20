import 'package:digital_hero/common/app_drawer.dart';
import 'package:digital_hero/constants/constansts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:digital_hero/theme/app_theme_provider.dart';

class HomeView extends ConsumerWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
      body: Switch(
        value: ref.watch(appThemeProvider.notifier).isLight(),
        onChanged: (value) {
          ref.read(appThemeProvider.notifier).changeTheme();
        },
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