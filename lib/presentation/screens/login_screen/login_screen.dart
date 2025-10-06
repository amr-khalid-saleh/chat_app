import 'dart:developer';

import 'package:chat_app/presentation/components/custom_button.dart';
import 'package:chat_app/presentation/components/custom_text_field.dart';
import 'package:chat_app/presentation/resources/color_manager.dart';
import 'package:chat_app/presentation/resources/image_manager.dart';
import 'package:chat_app/presentation/resources/text_style_manager.dart';
import 'package:chat_app/presentation/screens/register_screen/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../helper/show_snack_bar.dart';
import '../chat_screen/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background_color,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 1),
                ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image(
                    image: AssetImage(ImageManager.personal_picture),
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text('Chat App', style: TextStyleManager.White30ExtraBold),
                Spacer(flex: 1),
                Row(
                  children: [
                    Text('login', style: TextStyleManager.White24ExtraBold),
                  ],
                ),
                SizedBox(height: 12),
                CustomTextFormField(
                  hintText: 'email',
                  onChange: (value) {
                    email = value;
                  },
                ),
                SizedBox(height: 8),
                CustomTextFormField(
                  hintText: 'password',
                  onChange: (value) {
                    password = value;
                  },
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: 'login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginUser();
                        Navigator.pushReplacementNamed(context, ChatScreen.id);
                      } on FirebaseAuthException catch (e) {
                        showSnackBar(
                          context,
                          message: e.message.toString(),
                        );
                      } catch (e) {
                        log(e.toString());
                        showSnackBar(context, message: 'there was an error!');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?  ',
                      style: TextStyleManager.White20Medium,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, RegisterScreen.id),
                      child: Text(
                        'Register',
                        style: TextStyleManager.White16Medium,
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
