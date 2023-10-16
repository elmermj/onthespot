import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_the_spot/constants/variables.dart';
import 'package:on_the_spot/modules/chat/chat_controller.dart';
import 'package:on_the_spot/widgets/appbar.dart';

class ChatScreen extends GetView<ChatController> {
  ChatScreen({super.key});
  @override
  final ChatController controller = Get.put(ChatController());

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