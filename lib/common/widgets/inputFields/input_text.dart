import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constant/colors.dart';

class PrefixInputText extends StatefulWidget {
  const PrefixInputText({
    super.key,
    required this.hint,
    required this.preFixIcon,
    required this.keyboardType,
    this.maxLength,
    this.controller,
    this.validator,
    this.obscureText = false,
     this.enable = true,
  });

  final String hint;
  final Icon preFixIcon;
  final TextInputType keyboardType;
  final int? maxLength;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enable;

  @override
  _PrefixInputTextState createState() => _PrefixInputTextState();
}

class _PrefixInputTextState extends State<PrefixInputText> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      child: TextFormField(
        enabled: widget.enable,
        obscureText: _obscureText,
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        style: const TextStyle(color: TColors.white, fontSize: 18),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(color: TColors.primaryLight1, fontSize: 18),
          prefixIcon: widget.preFixIcon,
          fillColor: TColors.primaryDark2,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0.r),
            borderSide: BorderSide.none,
          ),
          suffixIcon: widget.obscureText
              ? GestureDetector(
            onTap: _togglePasswordView,
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: TColors.white,
                size: 22.h,
              ),
            ),
          )
              : null,
          contentPadding: EdgeInsets.symmetric(vertical: 18.h),
        ),
      ),
    );
  }
}
