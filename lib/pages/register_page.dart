import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynew_project/components/my_button.dart';
import 'package:mynew_project/components/my_textfield.dart';
import '../services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;
  bool isConfirmVisible = false;

  void register() async {
    if (isLoading) return;

    // Validate if passwords match first
    if (passwordController.text != confirmPasswordController.text) {
      _showErrorSnackBar("Passwords do not match!");
      return;
    }

    setState(() => isLoading = true);
    HapticFeedback.mediumImpact();

    final authService = AuthService();

    try {
      await authService.signUpWithEmailPassword(
        emailController.text.trim(),
        passwordController.text,
      );
    } catch (e) {
      if (!mounted) return;
      _showErrorSnackBar(e.toString().replaceFirst('Exception: ', ''));
    }

    if (mounted) setState(() => isLoading = false);
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(24),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
                const SizedBox(height: 30),

                // Icon / Logo with the same style as Login
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_add_rounded,
                    size: 80,
                    color: colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 32),

                // Header
                Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onSurface,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Create an account to start ordering",
                  style: TextStyle(
                    fontSize: 15,
                    color: colorScheme.onSurfaceVariant.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 40),

                // Email field
                MyTextField(
                  controller: emailController,
                  hintText: "Email address",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email_outlined, size: 20, color: colorScheme.primary),
                ),

                const SizedBox(height: 16),

                // Password field
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: !isPasswordVisible,
                  prefixIcon: Icon(Icons.lock_outline_rounded, size: 20, color: colorScheme.primary),
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility, size: 20),
                    onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                  ),
                ),

                const SizedBox(height: 16),

                // Confirm Password field
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: !isConfirmVisible,
                  prefixIcon: Icon(Icons.lock_reset_rounded, size: 22, color: colorScheme.primary),
                  suffixIcon: IconButton(
                    icon: Icon(isConfirmVisible ? Icons.visibility_off : Icons.visibility, size: 20),
                    onPressed: () => setState(() => isConfirmVisible = !isConfirmVisible),
                  ),
                ),

                const SizedBox(height: 32),

                // Sign Up Button
                MyButton(
                  text: "Create Account",
                  isLoading: isLoading,
                  onTap: register,
                ),

                const SizedBox(height: 32),

                // Back to Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member? ",
                      style: TextStyle(color: colorScheme.onSurfaceVariant),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login Now",
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