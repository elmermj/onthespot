import 'package:flutter/material.dart';
import 'package:on_the_spot/views/auth/components/auth_button.dart';
import 'package:on_the_spot/views/auth/components/email_field.dart';
import 'package:on_the_spot/views/auth/components/password_field.dart';

class FormWidget extends StatelessWidget {
  FormWidget({Key? key, required this.isLogin}) : super(key: key);

  final dynamic _formKey = GlobalKey<FormState>();
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            EmailField(isLogin: isLogin),
            PasswordField(isLogin: isLogin),
            const SizedBox(
              height: 15,
            ),
            AuthButton(
              formKey: _formKey,
              isLogin: isLogin,
            ),
          ],
        ),
      ),
    );
  }
}