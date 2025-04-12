import 'package:campus_cart/ui/utils/app_colors.dart';
import 'package:campus_cart/ui/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.validator,
      this.labelText,
      this.prefixIcon,
      this.hintText,
      this.textInputAction,
      this.keyboardType,
      required this.obscureText,
      this.suffixIcon});
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final Widget? prefixIcon;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextFormField(
        obscureText: obscureText,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            labelText: labelText,
            filled: true,
            fillColor: AppColors.seconderyColor,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.whiteColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
      ),
    );
  }
}
