import 'package:flutter/material.dart';
import 'gradient_scaffold.dart';

class GradientWrapper extends StatelessWidget {
  final Widget child;

  const GradientWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: child,
    );
  }
}
