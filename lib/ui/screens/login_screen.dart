import 'package:campus_cart/ui/screens/home_screen.dart';
import 'package:campus_cart/ui/screens/main_screen.dart';
import 'package:campus_cart/ui/screens/register_screen.dart';
import 'package:campus_cart/ui/screens/widgets/custom_text_form_field.dart';
import 'package:campus_cart/ui/utils/app_colors.dart';
import 'package:campus_cart/ui/utils/app_strings.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTeController = TextEditingController();
  final TextEditingController _passwordTeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: Center(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.appName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppStrings.welcomeText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icon(Icons.email_outlined),
                    obscureText: false,
                    controller: _emailTeController,
                    labelText: AppStrings.emailText,
                    hintText: AppStrings.loginHintText,
                  ),
                  CustomTextFormField(
                    validator: _validateStrongPassword,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    prefixIcon: Icon(Icons.remove_red_eye_outlined),
                    obscureText: true,
                    controller: _passwordTeController,
                    labelText: AppStrings.passwordText,
                    hintText: AppStrings.passwordHintText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: _onTapLoginButton,
                      child: Text(AppStrings.loginButtonText)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t Have An Account?'),
                      TextButton(onPressed: _onTapSignUp, child: Text('Sign Up'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    bool isValidEmail(String email) {
      return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
    }

    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    } else if (!isValidEmail(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validateStrongPassword(String? value) {
    String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!regex.hasMatch(value)) {
      return 'Password must be at least 8 characters,\ninclude upper & lower case letters,\na number and a special character.';
    }
    return null;
  }

  void _onTapLoginButton() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MainScreen()),
          (predicate) => false);
    }
  }
  void _onTapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
  }
}
