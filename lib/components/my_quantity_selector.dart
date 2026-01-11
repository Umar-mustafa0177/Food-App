import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/food.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(30), // Pill shape
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Decrease button
          _ControlButton(
            icon: Icons.remove_rounded,
            onTap: onDecrement,
            isEnabled: quantity > 0,
            colorScheme: colorScheme,
            isDestructive: quantity == 1, // Visual hint that it will remove item
          ),

          // Quantity display with Animation
          SizedBox(
            width: 34,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: Text(
                quantity.toString(),
                key: ValueKey<int>(quantity),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: colorScheme.onSurface,
                  fontFeatures: const [FontFeature.tabularFigures()], // Keeps width stable
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Increase button
          _ControlButton(
            icon: Icons.add_rounded,
            onTap: onIncrement,
            isEnabled: true,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isEnabled;
  final ColorScheme colorScheme;
  final bool isDestructive;

  const _ControlButton({
    required this.icon,
    required this.onTap,
    required this.isEnabled,
    required this.colorScheme,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = isDestructive
        ? colorScheme.error.withOpacity(0.1)
        : colorScheme.primary.withOpacity(0.1);

    final Color iconColor = isDestructive
        ? colorScheme.error
        : colorScheme.primary;

    return InkWell(
      onTap: isEnabled ? () {
        HapticFeedback.mediumImpact();
        onTap();
      } : null,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 32, // More compact for better UI fit
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isEnabled ? buttonColor : Colors.transparent,
        ),
        child: Icon(
          icon,
          size: 18,
          color: isEnabled ? iconColor : colorScheme.onSurface.withOpacity(0.2),
        ),
      ),
    );
  }
}