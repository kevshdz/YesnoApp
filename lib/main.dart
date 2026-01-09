  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme_app.dart';
import 'package:yes_no_app/screens/chat/chat_screen.dart';
import 'package:yes_no_app/screens/domain/providers/chat_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ChatProvider())
      ],
      child: MaterialApp(
        theme: ThemeApp().theme(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ChatScreen()
        ),
      ),
    );
  }
}