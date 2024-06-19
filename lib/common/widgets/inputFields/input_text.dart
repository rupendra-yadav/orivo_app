import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constant/colors.dart';

class PrefixInputText extends StatelessWidget {
  const PrefixInputText({
    super.key,
    required this.hint,
    required this.preFixIcon,
    required this.keyboardType,
    this.maxLength,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.obscureText = false,
  });

  final String hint;
  final Icon preFixIcon;
  final TextInputType keyboardType;
  final int? maxLength;
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        maxLength: maxLength,
        style: const TextStyle(color: TColors.white,fontSize: 18),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: TColors.white,fontSize: 18),
          prefixIcon: preFixIcon,
          fillColor: TColors.primaryDark2,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0.r), // Adjust the radius as needed
            borderSide: BorderSide.none, // Removes the default border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0.r), // Adjust the radius as needed
            borderSide: BorderSide.none, // Removes the border when enabled
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0.r), // Adjust the radius as needed
            borderSide: BorderSide.none, // Removes the border when focused
          ),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: CircleAvatar(
                    radius: 12.0.r,
                    backgroundColor: TColors.green,
                    child: suffixIcon,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.symmetric(vertical: 18.h)
        ),
      ),
    );
  }
}
