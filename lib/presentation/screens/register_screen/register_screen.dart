import 'package:chat_app/presentation/components/custom_button.dart';
import 'package:chat_app/presentation/components/custom_text_field.dart';
import 'package:chat_app/presentation/resources/color_manager.dart';
import 'package:chat_app/presentation/resources/text_style_manager.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static String id = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background_color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Text('Chat App', style: TextStyleManager.White30ExtraBold),
            Spacer(flex: 1),
            Row(
              children: [
                Text('Register', style: TextStyleManager.White24ExtraBold),
              ],
            ),
            SizedBox(height: 12),
            CustomTextField(hintText: 'email'),
            SizedBox(height: 8),
            CustomTextField(hintText: 'password'),
            SizedBox(height: 20),
            CustomButton(text: 'Register'),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I have an account.  ',
                  style: TextStyleManager.White20Medium,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text('Login', style: TextStyleManager.White16Medium),
                ),
              ],
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
