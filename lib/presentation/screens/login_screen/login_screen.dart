import 'package:chat_app/data/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/data/cubits/login_cubit/login_state.dart';
import 'package:chat_app/presentation/components/custom_button.dart';
import 'package:chat_app/presentation/components/custom_text_field.dart';
import 'package:chat_app/presentation/resources/color_manager.dart';
import 'package:chat_app/presentation/resources/image_manager.dart';
import 'package:chat_app/presentation/resources/text_style_manager.dart';
import 'package:chat_app/presentation/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../app/functions.dart';
import '../chat_screen/chat_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background_color,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            isLoading = true;
          } else if (state is LoginSuccessState) {
            Navigator.pushNamed(context, ChatScreen.id);
            isLoading = false;
          } else if (state is LoginFailureState) {
            isLoading = false;
            showSnackBar(context, message: state.errMessage);
          }
        },
        builder: (context, state) => ModalProgressHUD(
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
                      width: 155,
                      height: 155,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text('Chat App', style: TextStyleManager.White24ExtraBold),
                  Spacer(flex: 1),
                  Row(
                    children: [
                      Text(
                        'login',
                        style: TextStyleManager.White24ExtraBold.copyWith(
                          fontSize: 20,
                        ),
                      ),
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
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    text: 'login',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(
                          context,
                        ).loginUser(email: email!, password: password!);
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
      ),
    );
  }
}
