import 'package:flutter/material.dart';
import 'package:flutter_mobile_template/providers/localization/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/localization_provider.dart';

// Create extension method for dealing with localization like I did in the nymble project
import '../l10n/app_localizations.dart';

class SettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppLocalizations.of(context)!.hello)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Choose Language:'),
            ElevatedButton(
              onPressed: () {
                ref.read(localeProvider.notifier).state = const Locale('en');
              },
              child: const Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(localeProvider.notifier).state = const Locale('es');
              },
              child: const Text('Español'),
            ),
          ],
        ),
      ),
    );
  }
}
