import 'package:flutter/material.dart';
import 'package:mynew_project/components/my_drawer_tile.dart';
import 'package:mynew_project/services/auth/auth_service.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  // Async logout function
  Future<void> logout() async {
    final authService = AuthService();
    await authService.signOut();
    // Optionally, you can navigate to login page here if needed
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // App logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          // Divider
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // Home list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: MyDrawerTile(
              text: "H O M E",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),
          ),

          // Settings list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: MyDrawerTile(
              text: "S E T T I N G S",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
          ),

          // Logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: MyDrawerTile(
              text: "L O G O U T",
              icon: Icons.logout,
              onTap: () async {
                await logout();
                Navigator.pop(context);
              },
            ),
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
