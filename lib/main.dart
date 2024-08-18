import 'package:flutter/material.dart';
import 'package:flutter_mobile_template/app.dart';
import 'package:flutter_mobile_template/core/widgets/builder_error_widget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize the app
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return BuilderErrorWidget(details: details);
  };

  runApp(const App());
}
