import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_template/core/enums.dart';
import 'package:flutter_mobile_template/features/registration/bloc/registration_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  void _sendLoginEvent(BuildContext context, AuthenticationProviders provider) {
    context.read<RegistrationBloc>().add(LoginRequested(provider: provider));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const FlutterLogo(size: 150),
          const SizedBox(height: 50),
          SignInButton(
            Buttons.Google,
            onPressed: () {
              _sendLoginEvent(context, AuthenticationProviders.google);
            },
          ),
          SignInButton(
            Buttons.Apple,
            onPressed: () {
              _sendLoginEvent(context, AuthenticationProviders.apple);
            },
          ),
          SignInButton(
            Buttons.GitHub,
            onPressed: () {
              _sendLoginEvent(context, AuthenticationProviders.github);
            },
          ),
        ],
      ),
    );
  }
}
