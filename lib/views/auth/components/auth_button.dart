import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_the_spot/blocs/auth/login/login_event.dart';
import 'package:on_the_spot/blocs/auth/register/register_bloc.dart';
import 'package:on_the_spot/blocs/auth/register/register_event.dart';
import 'package:on_the_spot/blocs/auth/register/register_state.dart';
import 'package:on_the_spot/blocs/bloc_status.dart';
import 'package:on_the_spot/constants/app_strings.dart';

import '../../../blocs/auth/login/login_bloc.dart';
import '../../../blocs/auth/login/login_state.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.formKey, required this.isLogin})
      : super(key: key);

  final dynamic formKey;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return state.appStatus is FormSubmitting
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(LoginSubmitted());
                        }
                      },
                      child: Text(
                          isLogin ? AppStrings.login : AppStrings.register),
                    );
            },
          )
        : BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return state.appStatus is FormSubmitting
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<RegisterBloc>().add(RegisterSubmitted());
                        }
                      },
                      child: const Text(AppStrings.register),
                    );
            },
          );
  }
}