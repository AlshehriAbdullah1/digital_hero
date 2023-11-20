// import 'package:digital_hero/features/auth/controller/auth_controller.dart';
import 'package:digital_hero/features/auth/views/login_view.dart';
import 'package:digital_hero/features/home/views/home_view.dart';
import 'package:digital_hero/theme/app_theme.dart';
import 'package:digital_hero/theme/app_theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/app_drawer.dart';
import 'constants/constansts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isLight = ref.watch(appThemeProvider);
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      title: 'Digital Hero',
      theme: ref.watch(appThemeProvider),
      home: FutureBuilder(
        future: _auth.authStateChanges().first,
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator or splash screen if authentication state is loading
            return const CircularProgressIndicator(); // Or any other loading widget
          } else {
            // If a user is logged in, navigate to the HomeView, else navigate to the LoginView
            final bool isLoggedIn = snapshot.hasData;
            return isLoggedIn ? const HomeView() : const LoginView();
          }
        },
      ),
    );
  }
}

// class MyHomePage extends ConsumerWidget {
//   MyHomePage({super.key});
//   final logged = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // bool = ref.watch(appThemeProvider);
//     return FutureBuilder(
//       future: _auth.authStateChanges().first,
//       builder: (context, AsyncSnapshot<User?> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Show a loading indicator or splash screen if authentication state is loading
//           return CircularProgressIndicator(); // Or any other loading widget
//         } else {
//           // If a user is logged in, navigate to the HomeView, else navigate to the LoginView
//           final bool isLoggedIn = snapshot.hasData;
//           return isLoggedIn
//               ? 
//               : LoginView();
//         }
//       },
//     );
//   }
// }




// 


 /*return FutureBuilder(
      future: _auth.authStateChanges().first,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator or splash screen if authentication state is loading
          return CircularProgressIndicator(); // Or any other loading widget
        } else {
          // If a user is logged in, navigate to the HomeView, else navigate to the LoginView
          final bool isLoggedIn = snapshot.hasData;
          return isLoggedIn
              ? Scaffold(
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
                )
              : LoginView();
        }
      },
    );
      */