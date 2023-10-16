import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatController extends GetxController{
  late io.Socket socket;

  void connect(){
    socket = io.io('http://10.200.20.80:8898', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'autoReconnect': true,
      'autoReconnectDelay': 10,
      'pingInterval': 10,
      'pingTimeout': 5,
    });
    socket.connect();
    socket.onConnect((data) => print('connect'));
    socket.onDisconnect((data) => print('disconnect'));
    socket.onConnectError((data) => print('connect_error'));
    socket.onConnectTimeout((data) => print('connect_timeout'));
    socket.onError((data) => print('error'));
    socket.onReconnect((data) => print('reconnect'));
    socket.onReconnectAttempt((data) => print('reconnect_attempt'));
    socket.onReconnectError((data) => print('reconnect_error'));
    socket.onReconnectFailed((data) => print('reconnect_failed'));
    socket.onPing((data) => print('ping'));
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    socket.disconnect();
    socket.onDisconnect((data) => print('disconnect'));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    connect();
  }
}