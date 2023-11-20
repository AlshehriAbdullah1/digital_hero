import 'package:digital_hero/features/auth/controller/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:digital_hero/features/auth/views/login_view.dart';
import '../constants/constansts.dart';

import '../theme/app_theme_provider.dart';

class App_Drawer extends ConsumerWidget {
  const App_Drawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //avatar
                drawerAvatar,

                //space

                // greeting with name
                const Text(
                  'hello <<your name>>',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ListTile(
              title: Text(
                'Sign out',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              onTap: () async {
                AuthController.instance.signOut();
                Navigator.pushReplacement(context, LoginView.route());
                print('signed out! ');
              },
            ),
          ),
          Divider(
            thickness: 1,
            indent: MediaQuery.of(context).size.width * 0.05,
            endIndent: MediaQuery.of(context).size.width * 0.05,
            color: const Color(0xffDADADA),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  darkModeIcon,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 36,
                ),
                onPressed: () {
                  ref.read(appThemeProvider.notifier).changeTheme();
                },
              ),
              SizedBox(
                width: 40,
              ),
              IconButton(
                onPressed: () {
                  ref.read(appThemeProvider.notifier).changeTheme();
                },
                icon: Icon(
                  lightModeIcon,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 36,
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Container(
            child: digitalHeroLogo,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
            child: Text(
              Bio,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface, height: 1.5),
              maxLines: 10,

              overflow: TextOverflow
                  .ellipsis, // Define how text overflow should be handled
            ),
          )
        ],
      ),
    );
  }
}
