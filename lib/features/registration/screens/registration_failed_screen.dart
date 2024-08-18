import 'package:flutter/material.dart';

class RegistrationFailedScreen extends StatelessWidget {
  const RegistrationFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration Failed')),
      body: const Center(
        child: Text('Oops! Registration failed. Please try again.'),
      ),
    );
  }
}
