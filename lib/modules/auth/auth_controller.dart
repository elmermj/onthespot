import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Example: You can use a flag to determine if the user is logged in.
  RxBool isLoggedIn = false.obs;
  RxBool isPersonalAuth = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    // Implement your login logic here.
    // For example, set isLoggedIn to true after a successful login.
    isLoggedIn.value = true;
  }

  void logout() {
    // Implement your logout logic here.
    // For example, set isLoggedIn to false after a successful logout.
    isLoggedIn.value = false;
  }

  void togglePageChange(){
    isPersonalAuth.value =!isPersonalAuth.value;
  }
}