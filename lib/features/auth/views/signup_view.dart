import 'package:digital_hero/features/auth/controller/auth_controller.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add form key
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool isLoading = false;
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

  void _onSignUp() async {
    setState(() {
      isLoading = true;
    });
    // call the sign up controller class
    String? response = await AuthController.instance.signUp(
        emailController.text,
        passwordController.text,
        nameController.text,
        phoneNumberController.text);
    setState(() {
      isLoading = false;
    });
    if (response != null && response == 'Success') {
      Navigator.of(context).pushReplacement(HomeView.route());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response ?? 'Unexpected error occured'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: isLoading
                ? const CircularProgressIndicator()
                : Form(
                    key: _formKey,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
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
                            validator: (value) {
                              if (!value!.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: AuthField(
                            label: 'Phone Number',
                            controller: phoneNumberController,
                            hintText: 'Enter your Phone Number',
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              // I want to check if the value contains chars other than numbers or not, also I want its length to be 10 numbers only!

                              if (!(value!.length == 10) ||
                                  !value!.contains(RegExp(r'^[0-9]+$'))) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: AuthField(
                            label: 'Password',
                            controller: passwordController,
                            hintText: 'Enter your password',
                            validator: (value) {
                              if (value!.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _onSignUp();
                                }
                              },
                              child: const Text('Sign Up'),
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
                                        'Login! ',
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
      ),
    );
  }
}
