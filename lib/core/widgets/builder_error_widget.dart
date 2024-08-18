import 'package:flutter/material.dart';
import 'package:flutter_mobile_template/core/theme.dart';

class BuilderErrorWidget extends StatelessWidget {
  final FlutterErrorDetails details;

  const BuilderErrorWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Error Occurred'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 64.0,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Oops! Something went wrong.',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'An unexpected error has occurred.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Optional: Logic to retry or navigate elsewhere
                    // For simplicity, we will just restart the app
                    Navigator.of(context).pop();
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
