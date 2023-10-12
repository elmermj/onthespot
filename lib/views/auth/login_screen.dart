import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_the_spot/blocs/auth/login/login_bloc.dart';
import 'package:on_the_spot/blocs/auth/login/login_state.dart';
import 'package:on_the_spot/blocs/bloc_status.dart';
import 'package:on_the_spot/network/repository/repository_store.dart';
import 'package:on_the_spot/views/auth/components/form_widget.dart';
import 'package:on_the_spot/views/auth/components/have_account_text.dart';
import 'package:on_the_spot/views/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            LoginBloc(authRepo: RepositoryStore.authRepository),
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (previous, current) =>
              previous.appStatus != current.appStatus,
          listener: (context, state) {
            final formStatus = state.appStatus;

            if (formStatus is SubmissionFailed) {
              _showSnackBar(context, formStatus.exception.toString());
            }
            if (formStatus is SubmissionSuccess) {
              _goToHome(context);
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FormWidget(isLogin: true),
                    const SizedBox(height: 10),
                    const HaveAccountText(isLogin: true),
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

  void _goToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
  }
}