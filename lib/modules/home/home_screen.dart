import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_the_spot/constants/variables.dart';
import 'package:on_the_spot/modules/home/home_controller.dart';
import 'package:on_the_spot/widgets/appbar.dart';

class HomeScreen extends GetView<HomeController> { 
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: gradient
            ),
          ),
          
          const Align(
            alignment: AlignmentDirectional(0,-1),
            child: OTSAppBar(),
          ),
        ],
      ),
    );
  }
}