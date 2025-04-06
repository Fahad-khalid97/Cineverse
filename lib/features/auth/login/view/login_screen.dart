import 'dart:developer';

import 'package:cineverse/data/repo/auth_repo.dart';
import 'package:cineverse/theme/app_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';
import 'package:cineverse/di/di.dart';
import 'package:cineverse/theme/app_colors.dart';
import 'package:cineverse/widget/smart_widget/bottom_nav_bar/bottom_nav_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // Navigate to home screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BottomNavBar()),
            );
          } else if (state is LoginError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Sign In')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 15.h),
                        TextFormField(
                          controller: passwordController,
                          style: AppFonts.body1.copyWith(
                            color: AppColors.white,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Handle forgot password action
                        },
                        child: Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed:
                                state is LoginLoading
                                    ? null
                                    : () {
                                      if (emailController.text.isEmpty ||
                                          passwordController.text.isEmpty) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Please enter your username and password',
                                            ),
                                          ),
                                        );
                                      } else {
                                        context.read<LoginCubit>().login(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                            child:
                                state is LoginLoading
                                    ? const CircularProgressIndicator(
                                      color: AppColors.white,
                                    )
                                    : const Text('Login'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  RichText(
                    text: TextSpan(
                      text: 'New user? ',
                      style: Theme.of(context).textTheme.titleLarge,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: Theme.of(context).textTheme.titleLarge,
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle sign up action
                                },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'By continuing, you agree to the Terms of Use. Read our Privacy Policy.',
                    textAlign: TextAlign.center,
                    style: AppFonts.subtitle2Regular.copyWith(
                      color: Theme.of(context).textTheme.labelMedium?.color,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
