import 'package:chat_app/presentation/screens/login_screen/login_screen.dart';
import 'package:chat_app/presentation/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.id:(context)=>LoginScreen(),
        RegisterScreen.id:(context)=>RegisterScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoginScreen',
    );
  }
}
