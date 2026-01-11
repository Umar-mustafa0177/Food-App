import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mynew_project/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sirf ek baar colorScheme uthayein
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          "S E T T I N G S",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
      ),
      body: ListView( // SingleChildScrollView se behtar ListView hai performance ke liye
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          // Theme Toggle Box
          Container(
            decoration: BoxDecoration(
              color: colorScheme.secondary.withOpacity(0.1), // Fixed color logic
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.dark_mode_rounded, color: colorScheme.primary),
                    const SizedBox(width: 15),
                    Text(
                      "Dark Mode",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),

                // Switch with explicit listen: false if needed inside callbacks
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return CupertinoSwitch(
                      activeColor: colorScheme.primary,
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        // Toggle theme safely
                        themeProvider.toggleTheme();
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Version Info
          _buildInfoTile(colorScheme),
        ],
      ),
    );
  }

  Widget _buildInfoTile(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline_rounded, color: colorScheme.primary),
          const SizedBox(width: 15),
          const Text(
            "App Version: 1.0.0",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}