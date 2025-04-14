import 'package:campus_cart/ui/screens/main_screen.dart';
import 'package:campus_cart/ui/screens/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool _signUpInProgress = false;

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
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
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
                      ElevatedButton(
                          onPressed: _onTapSignUp,
                          child: Visibility(
                              visible: _signUpInProgress == false,
                              replacement: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                              child: Text('Sign Up'))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Already Have an Account?'),
                          TextButton(
                              onPressed: _onTapLogin, child: Text('Log In')),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _signUpInProgress = true;
      });

      try {
        final FirebaseAuth _auth = FirebaseAuth.instance;
        final FirebaseFirestore _firestore = FirebaseFirestore.instance;

        // Create user with email and password
        final UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Store additional user info in Firestore
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': _emailController.text.trim(),
          'firstName': _firstNameController.text.trim(),
          'lastName': _lastNameController.text.trim(),
          'mobile': _mobileController.text.trim(),
          'uid': userCredential.user!.uid,
          'createdAt': FieldValue.serverTimestamp(),
        });

        // Navigate to main screen
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        }
      } on FirebaseAuthException catch (e) {
        String message = 'Registration failed. Please try again.';
        if (e.code == 'email-already-in-use') {
          message = 'This email is already in use.';
        } else if (e.code == 'weak-password') {
          message = 'Password is too weak.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An unexpected error occurred.')),
        );
      } finally {
        if (mounted) {
          setState(() {
            _signUpInProgress = false;
          });
        }
      }
    }
  }


  void _onTapLogin() {
    Navigator.pop(context);
  }
}
