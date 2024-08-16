import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Widget createTestWidget(
  Widget child, {
  List<NavigatorObserver>? observers,
  List<Override>? overrides,
  List<String>? routes,
}) {
  return ProviderScope(
    overrides: overrides ?? [],
    child: MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en', ''),
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      home: child,
      navigatorObservers: observers ?? [],
      routes: {
        if (routes != null)
          for (final route in routes)
            route: (context) => buildDummyWidget(
                  title: removePrefix(route, '/'),
                  bodyText: removePrefix(route, '/'),
                  key: Key(removePrefix(route, '/')),
                ),
      },
    ),
  );
}

Widget buildDummyWidget({
  required String title,
  required String bodyText,
  required Key key,
}) {
  return Scaffold(
    key: key,
    appBar: AppBar(
      title: Text(title),
    ),
    body: Center(
      child: Text(bodyText),
    ),
  );
}

String removePrefix(String str, String prefix) {
  if (str.startsWith(prefix)) {
    return str.replaceFirst(prefix, '');
  }
  return str;
}
