import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _InfoItem(
            title: 'Delivery fee',
            value: 'PKR 99',  // ← changed to PKR to match your app currency
            valueStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colorScheme.primary,
              letterSpacing: -0.3,
            ),
            titleStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurfaceVariant,
            ),
          ),

          Container(
            width: 1,
            height: 36,
            color: colorScheme.outline.withOpacity(0.4),
          ),

          _InfoItem(
            title: 'Delivery time',
            value: '15–30 min',
            valueStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: colorScheme.primary,
              letterSpacing: -0.3,
            ),
            titleStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle valueStyle;
  final TextStyle titleStyle;

  const _InfoItem({
    required this.title,
    required this.value,
    required this.valueStyle,
    required this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: valueStyle,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: titleStyle,
        ),
      ],
    );
  }
}