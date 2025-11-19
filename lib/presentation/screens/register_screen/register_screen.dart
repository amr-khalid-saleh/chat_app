import 'dart:developer';
import 'package:chat_app/data/cubits/register_cubit/register_cubit.dart';
import 'package:chat_app/presentation/components/custom_button.dart';
import 'package:chat_app/presentation/components/custom_text_field.dart';
import 'package:chat_app/presentation/resources/color_manager.dart';
import 'package:chat_app/presentation/resources/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../app/functions.dart';
import '../../../data/cubits/register_cubit/register_state.dart';
import '../chat_screen/chat_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background_color,
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            isLoading = true;
          } else if (state is RegisterSuccessState) {
            Navigator.pushNamed(context, ChatScreen.id);
            isLoading = false;
          } else if (state is RegisterFailureState) {
            isLoading = false;
            showSnackBar(context, message: state.errMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 1),
                    Text('Chat App', style: TextStyleManager.White24ExtraBold),
                    Spacer(flex: 1),
                    Row(
                      children: [
                        Text(
                          'Register',
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
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'Register',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(
                            context,
                          ).registerUser(email: email!, password: password!);
                        }
                      },
                    ),
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
                          child: Text(
                            'Login',
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
          );
        },
      ),
    );
  }
}
