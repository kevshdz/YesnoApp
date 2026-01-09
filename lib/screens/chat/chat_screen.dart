import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/screens/domain/entities/message.dart';
import 'package:yes_no_app/screens/domain/providers/chat_provider.dart';
import 'package:yes_no_app/screens/widgets/her_message.dart';
import 'package:yes_no_app/screens/widgets/message_input.dart';
import 'package:yes_no_app/screens/widgets/my_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(padding: EdgeInsetsGeometry.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2017/11/10/05/46/user-2935524_1280.png"),
        ),),
        title: Text("Chat Screen"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.message.length,
              itemBuilder: (context,item){
              final message = chatProvider.message[item];
              
              return (message.fromWho == FromWho.her) ? HerMessage(message: message) : MyMessage(message.text); 
            })),
            MessageInput(
              onValue: (value ) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}