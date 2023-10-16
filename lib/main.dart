import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:on_the_spot/constants/color_scheme.g.dart';
import 'package:on_the_spot/modules/auth/auth_controller.dart';
import 'package:on_the_spot/modules/auth/auth_screen.dart';
import 'package:on_the_spot/modules/home/home_screen.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: lightColorScheme
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme
      ),
      home: Obx(
        () {
          if (authController.isLoggedIn.value) {
            return HomeScreen();
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}