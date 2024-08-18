import 'package:flutter/material.dart';
import 'package:flutter_mobile_template/app.dart';
import 'package:flutter_mobile_template/core/widgets/builder_error_widget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'env.dart';

final supabase = Supabase.instance.client;

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  _inintializeApp();

  runApp(const App());
}

Future<void> _inintializeApp() async {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return BuilderErrorWidget(details: details);
  };

  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );
}
