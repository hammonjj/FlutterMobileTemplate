import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

  // Add support for Language, Theme, and Notifications

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferences')),
      body: const Center(
        child: Text('Preferences'),
      ),
    );
  }
}
