import 'package:bloc_login_register_flutter/screens/auth/components/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obscurePassword = true;
  bool signInRequired = false;

  final emailRegex =
  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        signInRequired = true;
      });

      // აქ შემდეგში ჩასვამ Firebase / Bloc login-ს
      print("Email: ${emailController.text}");
      print("Password: ${passwordController.text}");

      setState(() {
        signInRequired = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [

          /// EMAIL
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(CupertinoIcons.mail_solid),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please fill in this field';
                } else if (!emailRegex.hasMatch(val)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
          ),

          const SizedBox(height: 15),

          /// PASSWORD
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: obscurePassword,
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword
                      ? CupertinoIcons.eye_fill
                      : CupertinoIcons.eye_slash_fill,
                ),
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter password';
                } else if (val.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
          ),

          const SizedBox(height: 25),

          /// BUTTON
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: ElevatedButton(
              onPressed: signInRequired ? null : signIn,
              child: signInRequired
                  ? const CircularProgressIndicator(
                color: Colors.white,
              )
                  : const Text("Sign In"),
            ),
          ),
        ],
      ),
    );
  }
}