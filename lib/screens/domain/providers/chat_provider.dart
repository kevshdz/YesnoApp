

import 'package:flutter/material.dart';
import 'package:yes_no_app/screens/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();

  List<Message> message = [
    Message(text: "Hello", fromWho: FromWho.mine),
    Message(text: "How are you?", fromWho: FromWho.her),
  ];

  Future<void> sendMessage(String text) async{
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    message.add(newMessage);
    notifyListeners();
    moveScrollToBottom();


  }

  void moveScrollToBottom() async {
      await Future.delayed(Duration(microseconds: 100));
      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent, 
        duration: Duration(microseconds: 300), 
        curve: Curves.bounceInOut);

  }
}