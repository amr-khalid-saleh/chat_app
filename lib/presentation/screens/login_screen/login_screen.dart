import 'package:chat_app/presentation/components/custom_button.dart';
import 'package:chat_app/presentation/components/custom_text_field.dart';
import 'package:chat_app/presentation/resources/color_manager.dart';
import 'package:chat_app/presentation/resources/image_manager.dart';
import 'package:chat_app/presentation/resources/text_style_manager.dart';
import 'package:chat_app/presentation/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static String id = 'LoginScreen';

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
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image(
                image: AssetImage(ImageManager.personal_picture),
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0,),
            Text('Chat App', style: TextStyleManager.White30ExtraBold),
            Spacer(flex: 1),
            Row(
              children: [
                Text('login', style: TextStyleManager.White24ExtraBold),
              ],
            ),
            SizedBox(height: 12),
            CustomTextField(hintText: 'email'),
            SizedBox(height: 8),
            CustomTextField(hintText: 'password'),
            SizedBox(height: 20),
            CustomButton(text: 'login'),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?  ',
                  style: TextStyleManager.White20Medium,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, RegisterScreen.id),
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
    );
  }
}
