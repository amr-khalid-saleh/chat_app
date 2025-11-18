import 'package:chat_app/data/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/presentation/screens/chat_screen/chat_screen.dart';
import 'package:chat_app/presentation/screens/login_screen/login_screen.dart';
import 'package:chat_app/presentation/screens/register_screen/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        },
        debugShowCheckedModeBanner: false,
        color: Colors.transparent,
        initialRoute: LoginScreen.id,
      ),
    );
  }
}
