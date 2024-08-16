import 'package:flutter/material.dart';
import 'package:flutter_mobile_template/providers/registration/registration_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FirstVehiclenScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registrationState = ref.watch(registrationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('First Vehicle ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: ${registrationState.username}'),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
