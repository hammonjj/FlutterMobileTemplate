import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobile_template/features/localization/bloc/localization_bloc.dart';
import 'package:flutter_mobile_template/features/localization/bloc/localization_event.dart';

class SettingsLandingScreen extends StatelessWidget {
  const SettingsLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.hello_world)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.choose_language),
            ElevatedButton(
              onPressed: () {
                context.read<LocalizationBloc>().add(const ChangeLocaleEvent(Locale('en')));
              },
              child: const Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LocalizationBloc>().add(const ChangeLocaleEvent(Locale('es')));
              },
              child: const Text('Español'),
            ),
          ],
        ),
      ),
    );
  }
}
