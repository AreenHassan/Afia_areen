import 'package:flutter/material.dart';

import '../color.dart';

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon; 
  final String label;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.prefixIcon,
    required this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon, 
          fillColor: Appcolor.med,
          filled: true,
          label: Text(label),
          prefixIcon: Icon(prefixIcon, color: Appcolor.maincolor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
