import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon; // Added for icons like Email/Lock
  final Widget? suffixIcon; // Added for show/hide password
  final TextInputType? keyboardType;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
        cursorColor: colorScheme.primary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: colorScheme.onSurfaceVariant.withOpacity(0.5),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),

          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,

          // Background styling
          filled: true,
          fillColor: colorScheme.surfaceVariant.withOpacity(0.35),

          // Default State
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),

          // Inactive State
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: colorScheme.outlineVariant.withOpacity(0.4),
              width: 1,
            ),
          ),

          // Active Focus State
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: colorScheme.primary,
              width: 2,
            ),
          ),

          contentPadding: const EdgeInsets.all(20),
        ),
      ),
    );
  }
}