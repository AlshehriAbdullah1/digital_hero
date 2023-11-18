import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:digital_hero/theme/app_theme_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Switch(
      value: ref.watch(appThemeProvider.notifier).isLight(),
      onChanged: (value) {
        ref.read(appThemeProvider.notifier).changeTheme();
      },
    );
  }
}
