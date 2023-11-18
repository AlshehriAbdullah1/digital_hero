import 'package:digital_hero/features/auth/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:digital_hero/features/home/views/home_view.dart';
import 'package:digital_hero/features/auth/widgets/auth_field.dart';

class SignUpView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  // void _onLogin() {
  //   Navigator.of(context).push(HomeView.route());
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create an account ',
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Connect with your friends today! ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: AuthField(
                    label: 'Name',
                    controller: nameController,
                    hintText: 'Enter Your Name ',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: AuthField(
                    controller: emailController,
                    hintText: 'example@example.com',
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: AuthField(
                    label: 'Phone Number',
                    controller: phoneNumberController,
                    hintText: 'Enter your Phone Number',
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: AuthField(
                    label: 'Password',
                    controller: passwordController,
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Login'),
                    ),
                  ),
                ),

                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    children: [
                      const TextSpan(text: 'Already have an account? '),
                      WidgetSpan(
                          child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context, LoginView.route());
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
        ),
      ),
    );
  }
}
