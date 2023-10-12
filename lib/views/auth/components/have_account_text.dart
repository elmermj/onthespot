import 'package:flutter/material.dart';
import 'package:on_the_spot/constants/app_strings.dart';
import 'package:on_the_spot/views/auth/login_screen.dart';
import 'package:on_the_spot/views/auth/register_screen.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({Key? key, required this.isLogin}) : super(key: key);

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLogin ? () => _goToRegister(context) : () => _goToLogin(context),
      child: Text(isLogin ? AppStrings.haventAccount : AppStrings.haveAccount),
    );
  }

  void _goToRegister(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
        (route) => false);
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}