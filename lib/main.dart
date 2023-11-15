import 'package:digital_hero/theme/app_theme.dart';
import 'package:digital_hero/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/app_drawer.dart';
import 'constants/constansts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isLight = ref.watch(appThemeProvider);
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      title: 'Digital Hero',
      theme: ref.watch(appThemeProvider),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool = ref.watch(appThemeProvider);
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
      body: Container(
        child: Switch(
          value: ref.watch(appThemeProvider.notifier).isLight(),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
