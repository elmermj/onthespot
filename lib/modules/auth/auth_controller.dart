import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realm/realm.dart';

class AuthController extends GetxController {
  App app = App(AppConfiguration("porto-space-khzmr"));
  // Example: You can use a flag to determine if the user is logged in.
  RxBool isLoggedIn = false.obs;
  RxBool isPersonalAuth = true.obs;
  RxBool isLoginForm = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> login(String email, String password, bool isPersonalAuth) async {
    // Implement your login logic here.
    // For example, set isLoggedIn to true after a successful login.
    try {
      final emailPwCredentials = Credentials.emailPassword(email, password);
      await app.logIn(emailPwCredentials);
      isLoggedIn.value = true;
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void logout() {
    // Implement your logout logic here.
    // For example, set isLoggedIn to false after a successful logout.
    isLoggedIn.value = false;
  }

  Future<void> register(String email, String password, bool isPersonalAuth) async {
    try {
      EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(app);
      await authProvider.registerUser(email, password);
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void togglePageChange(){
    isPersonalAuth.value =!isPersonalAuth.value;
  }

  void toggleForm(){
    isLoginForm.value =!isLoginForm.value;
  }
}