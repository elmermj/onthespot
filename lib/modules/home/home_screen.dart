import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_the_spot/constants/variables.dart';
import 'package:on_the_spot/modules/chat/chat_screen.dart';
import 'package:on_the_spot/modules/home/home_controller.dart';
import 'package:on_the_spot/widgets/appbar.dart';

class HomeScreen extends GetView<HomeController> { 
  HomeScreen({super.key});
  @override
  final HomeController controller = Get.put(HomeController());

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
          Container(
            height: Get.height-kToolbarHeight,
            margin: const EdgeInsets.only(top: kToolbarHeight),
            child: ListView.builder(
              itemCount: controller.chatList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                  ),
                  title: Text(
                    controller.chatList[index].name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    controller.chatList[index].textPreview,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Text(
                    controller.chatList[index].lastItemTime.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  onTap: () {
                    Get.to(()=> ChatScreen());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}