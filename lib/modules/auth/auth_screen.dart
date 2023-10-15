import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_the_spot/constants/color_scheme.g.dart';
import 'package:on_the_spot/constants/variables.dart';
import 'package:on_the_spot/modules/auth/auth_controller.dart';
import 'package:on_the_spot/modules/home/home_screen.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: gradient
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0.2),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: lightColorScheme.primary.withOpacity(0.4),
              ),
              padding: const EdgeInsets.all(12),
              child: Form(
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
                    const SizedBox(height: 12,),
                    TextButton(
                      onPressed: ()=>Get.off(()=>const HomeScreen()), 
                      child: Text("Login", style: TextStyle(color: lightColorScheme.secondary),),
                    )
                  ]
                )
              ),
            ),
          )
        ]
      ),
      floatingActionButton: Container(
        color: Colors.transparent,
        width: Get.width,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: controller.isPersonalAuth.value?lightColorScheme.secondary.withOpacity(0.4):Colors.transparent,
                  foregroundColor: controller.isPersonalAuth.value?lightColorScheme.onSecondary:lightColorScheme.secondary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                onPressed: (){
                  controller.isPersonalAuth.value = true;
                },
                child: const Text('Personal'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: controller.isPersonalAuth.value?Colors.transparent:lightColorScheme.secondary.withOpacity(0.4),
                  foregroundColor: controller.isPersonalAuth.value?lightColorScheme.secondary:lightColorScheme.onSecondary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onPressed: (){
                  controller.isPersonalAuth.value = false;
                },
                child: const Text('Business'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}