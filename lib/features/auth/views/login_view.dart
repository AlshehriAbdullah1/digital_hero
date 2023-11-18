import 'package:digital_hero/features/auth/views/signup_view.dart';
import 'package:flutter/material.dart';

import 'package:digital_hero/features/home/views/home_view.dart';
import 'package:digital_hero/features/auth/widgets/auth_field.dart';

class LoginView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // void _onLogin() {
  //   Navigator.of(context).push(HomeView.route());
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi, Welcome ',
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: AuthField(
                label: 'Email',
                controller: emailController,
                hintText: 'example@example.com',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: AuthField(
                label: 'Password',
                controller: passwordController,
                hintText: 'must be at least 6 characters',
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                  width: double.infinity,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text('Login'))),
            ),

            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                children: [
                  const TextSpan(text: 'Don\'t have an account? '),
                  WidgetSpan(
                      child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context, SignUpView.route());
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ))),
                ],
              ),
            ),
            // GestureDetector(
            //   child: const Chip(
            //     label: Text('Login'),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
