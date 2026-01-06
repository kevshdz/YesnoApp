import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(itemBuilder: (context,item){
              return (item % 2 == 0) ? MyMessage():HerMessage();
            })),
            MessageInput()
          ],
        ),
      ),
    );
  }
}