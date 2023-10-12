import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_the_spot/blocs/auth/register/register_bloc.dart';
import 'package:on_the_spot/blocs/auth/register/register_state.dart';
import 'package:on_the_spot/blocs/bloc_status.dart';
import 'package:on_the_spot/network/repository/repository_store.dart';
import 'package:on_the_spot/views/auth/components/form_widget.dart';
import 'package:on_the_spot/views/auth/components/have_account_text.dart';
import 'package:on_the_spot/views/welcome/welcome_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            RegisterBloc(authRepo: RepositoryStore.authRepository),
        child: BlocListener<RegisterBloc, RegisterState>(
          listenWhen: (previous, current) =>
              previous.appStatus != current.appStatus,
          listener: (context, state) {
            final formStatus = state.appStatus;

            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }

            if (formStatus is SubmissionSuccess) {
              _goToWelcome(context);
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FormWidget(isLogin: false),
                    const SizedBox(height: 10),
                    const HaveAccountText(isLogin: false),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _goToWelcome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        (route) => false);
  }
}