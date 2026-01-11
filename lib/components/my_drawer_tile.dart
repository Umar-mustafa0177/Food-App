import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDrawerTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? iconColor;
  final bool isDestructive;

  const MyDrawerTile({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    this.textColor,
    this.iconColor,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Modern Color Logic
    final Color effectiveColor = isDestructive
        ? colorScheme.error
        : (textColor ?? colorScheme.onSurface);

    final Color effectiveIconColor = isDestructive
        ? colorScheme.error
        : (iconColor ?? colorScheme.onSurfaceVariant);

    final Color tileBackgroundColor = isDestructive
        ? colorScheme.error.withOpacity(0.06) // Subtle red tint for logout
        : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2), // Spacing between tiles
      child: ListTile(
        onTap: onTap != null
            ? () {
          HapticFeedback.lightImpact();
          onTap!();
        }
            : null,

        // Visual Style
        tileColor: tileBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Match with Drawer curvature
        ),
        splashColor: (isDestructive ? colorScheme.error : colorScheme.primary).withOpacity(0.1),
        hoverColor: colorScheme.primary.withOpacity(0.05),

        // Content
        minLeadingWidth: 20, // Tighter spacing for modern look
        leading: icon != null
            ? Icon(
          icon,
          size: 22,
          color: effectiveIconColor,
        )
            : null,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isDestructive ? FontWeight.w700 : FontWeight.w600,
            color: effectiveColor,
            letterSpacing: -0.3,
          ),
        ),
        trailing: onTap != null && !isDestructive
            ? Icon(
          Icons.chevron_right_rounded,
          size: 18,
          color: colorScheme.onSurfaceVariant.withOpacity(0.4),
        )
            : null,
      ),
    );
  }
}