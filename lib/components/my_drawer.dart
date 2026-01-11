import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynew_project/components/my_drawer_tile.dart';
import 'package:mynew_project/services/auth/auth_service.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    HapticFeedback.mediumImpact();
    final authService = AuthService();
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Drawer(
      width: 300, // Slightly wider for better text breathing space
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      backgroundColor: colorScheme.surface,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header / Brand area
          Container(
            padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primary.withOpacity(0.08),
                  colorScheme.surface,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo Icon with outer soft glow
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.restaurant_rounded,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Foodie',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onSurface,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.flash_on, size: 14, color: colorScheme.primary),
                    const SizedBox(width: 4),
                    Text(
                      'Good food, fast delivery',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Main Navigation
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12), // Side padding for tiles
              child: ListView(
                padding: const EdgeInsets.only(top: 12),
                children: [
                  MyDrawerTile(
                    icon: Icons.home_rounded,
                    title: 'Home',
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 8),
                  MyDrawerTile(
                    icon: Icons.settings_rounded,
                    title: 'Settings',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SettingsPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Footer
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.5)),
              ),
            ),
            child: Column(
              children: [
                MyDrawerTile(
                  icon: Icons.logout_rounded,
                  title: 'Log out',
                  isDestructive: true,
                  onTap: () => _handleLogout(context),
                ),
                const SizedBox(height: 20),
                Text(
                  'v1.0.0 • Made with ❤️ in Pakistan',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant.withOpacity(0.5),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}