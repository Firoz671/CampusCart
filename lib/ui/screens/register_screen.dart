import 'package:campus_cart/ui/screens/main_screen.dart';
import 'package:campus_cart/ui/screens/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter a valid email';
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Enter a valid email format';
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  controller: _emailController,
                  obscureText: false,
                ),
                CustomTextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'First name is required';
                    }
                    return null;
                  },
                  hintText: 'Enter your first name',
                  labelText: 'First Name',
                  controller: _firstNameController,
                  obscureText: false,
                ),
                CustomTextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Last name is required';
                    }
                    return null;
                  },
                  hintText: 'Enter your last name',
                  labelText: 'Last Name',
                  controller: _lastNameController,
                  obscureText: false,
                ),
                CustomTextFormField(
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Mobile number is required';
                    } else if (!RegExp(r'^\d{10,}$').hasMatch(value)) {
                      return 'Enter a valid mobile number';
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.phone),
                  hintText: 'Enter your mobile',
                  labelText: 'Mobile',
                  controller: _mobileController,
                  obscureText: false,
                ),
                CustomTextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                ),
                CustomTextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: 'Confirm your password',
                  labelText: 'Confirm Password',
                  controller: _confirmPasswordController,
                  obscureText: true,
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: _onTapSignUp, child: Text('Sign Up')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Already Have an Account?'),
                    TextButton(onPressed: _onTapLogin, child: Text('Log In')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUp() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }

  void _onTapLogin() {
    Navigator.pop(context);
  }
}
