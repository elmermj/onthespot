import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_the_spot/models/chat_list.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin{
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  RxList<ChatList> chatList = <ChatList>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    chatList.value = List.generate(3, (index){
      return ChatList(
        name: 'Chat ${index + 1}',
        textPreview: 'Last message from ${index + 1}',
        lastItemTime: DateTime.now(),
        avatarUrl: 'assets/images/profile_pic.png',
      );
    });
  }
}