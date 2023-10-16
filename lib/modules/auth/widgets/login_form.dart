import 'package:flutter/material.dart';
import 'package:on_the_spot/constants/color_scheme.g.dart';
import 'package:on_the_spot/modules/auth/auth_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.controller,
  });

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              fillColor: Color.fromRGBO(213, 213, 213, 1),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(235, 235, 235, 0.4),
                  width: 0.1
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(235, 235, 235, 0.4),
                  width: 0.1
                )
              )
            ),
          ),
          const SizedBox(height: 12,),
          TextFormField(
            controller: controller.passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              fillColor: Color.fromRGBO(255, 0, 0, 1),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(235, 235, 235, 0.4),
                  width: 0.1,
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(235, 235, 235, 0.4),
                  width: 0.1
                )
              )
            )
          ),
          const SizedBox(height: 12),
          TextButton(
            child: Text("Don't have an account? Register", style: TextStyle(color: lightColorScheme.secondary),),
            onPressed: ()=> controller.toggleForm(),
          ),
          const SizedBox(height: 12,),
          TextButton(
            onPressed: ()=>controller.login(controller.emailController.text, controller.passwordController.text, controller.isPersonalAuth.value), 
            child: Text("Login", style: TextStyle(color: lightColorScheme.secondary),),
          )
        ]
      )
    );
  }
}