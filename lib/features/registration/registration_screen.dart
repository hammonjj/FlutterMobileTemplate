import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  /// Show a simple "___ Button Pressed" indicator
  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: const Duration(milliseconds: 400),
    ));
  }

  /// Normally the signin buttons should be contained in the SignInPage
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SignInButtonBuilder(
            text: 'Get going with Email',
            icon: Icons.email,
            onPressed: () {
              _showButtonPressDialog(context, 'Email');
            },
            backgroundColor: Colors.blueGrey[700]!,
            width: 220.0,
          ),
          const Divider(),
          SignInButton(
            Buttons.Google,
            onPressed: () {
              _showButtonPressDialog(context, 'Google');
            },
          ),
          const Divider(),
          SignInButton(
            Buttons.GoogleDark,
            onPressed: () {
              _showButtonPressDialog(context, 'Google (dark)');
            },
          ),
          const Divider(),
          SignInButton(
            Buttons.FacebookNew,
            onPressed: () {
              _showButtonPressDialog(context, 'FacebookNew');
            },
          ),
          const Divider(),
          SignInButton(
            Buttons.Apple,
            onPressed: () {
              _showButtonPressDialog(context, 'Apple');
            },
          ),
        ],
      ),
    );
  }
}
