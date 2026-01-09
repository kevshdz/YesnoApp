

import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/yes_no_answer.dart';
import 'package:yes_no_app/screens/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();


  List<Message> message = [];

  Future<void> sendMessage(String text) async{
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    message.add(newMessage);

    if(text.endsWith("?")){
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();


  }

  Future <void> herReply() async{
    final herMessage = await getYesNoAnswer.getAnswer();
    message.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  
  }
  /*
  void moveScrollToBottom() async {
      await Future.delayed(Duration(microseconds: 300));
      chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent, 
        duration: Duration(microseconds: 500), 
        curve: Curves.bounceInOut);

  }*/
  void moveScrollToBottom() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!chatScrollController.hasClients) return;

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  });
}

}