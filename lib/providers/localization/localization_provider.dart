import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final localeProvider = StateProvider<Locale>((ref) {
  return const Locale('en');
});

final supportedLocalesProvider = Provider<List<Locale>>((ref) {
  return const [Locale('en'), Locale('es')];
});

final localizationsDelegatesProvider =
    Provider<List<LocalizationsDelegate>>((ref) {
  return const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
});
