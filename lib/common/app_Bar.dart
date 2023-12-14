import 'package:digital_hero/constants/constansts.dart';
import 'package:digital_hero/features/cart/views/cart_view.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, this.title});
  String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title == null ? digitalHeroLogo : Text(title!),
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(CartView.route());
            },
            icon: Icon(
              shoppingCartIcon,
              color: Theme.of(context).colorScheme.onPrimary,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
