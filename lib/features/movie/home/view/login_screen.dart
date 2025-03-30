import 'package:cineverse/theme/app_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
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
                      onPressed: () {
                        // Handle login action
                      },
                      child: const Text('Login'),
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
  }
}
