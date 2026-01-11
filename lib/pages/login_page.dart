import 'package:flutter/material.dart';
import 'package:mynew_project/components/my_button.dart';
import 'package:mynew_project/components/my_textfield.dart';
import 'package:mynew_project/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth/auth_gate.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isPasswordVisible = false; // For password toggle

  void login() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
        emailController.text.trim(),
        emailController.text.isEmpty ? "" : passwordController.text,
      );

      // AGAR LOGIN SUCCESSFUL HO JAYE:
      if (mounted) {
        // User ko AuthGate par bhej dein, wo khud decide karega ke ab Home dikhana hai
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AuthGate()), // Ab ye error nahi dega
        );
      }

    } catch (e) {
      if (!mounted) return;
      _showErrorSnackBar(e.toString().replaceFirst("Exception: ", ""));
    }

    if (mounted) setState(() => isLoading = false);
  }

  // Modern way to show errors instead of a clunky Dialog
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 50),

                // Premium Logo Animation Area
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.restaurant_rounded,
                    size: 80,
                    color: colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 40),

                // Welcome Header
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onSurface,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Greetings! Enter your details to continue",
                  style: TextStyle(
                    fontSize: 15,
                    color: colorScheme.onSurfaceVariant.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 48),

                // Email Field (Using refined component)
                MyTextField(
                  controller: emailController,
                  hintText: "Email address",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email_outlined, size: 20, color: colorScheme.primary),
                ),

                const SizedBox(height: 16),

                // Password Field
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: !isPasswordVisible,
                  prefixIcon: Icon(Icons.lock_outline_rounded, size: 20, color: colorScheme.primary),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                      size: 20,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                  ),
                ),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, top: 4),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Sign In Button (Using refined component)
                MyButton(
                  text: "Sign In",
                  isLoading: isLoading,
                  onTap: login,
                ),

                const SizedBox(height: 32),

                // Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New here? ",
                      style: TextStyle(color: colorScheme.onSurfaceVariant),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}