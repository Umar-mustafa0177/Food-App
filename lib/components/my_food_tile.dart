import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          highlightColor: colorScheme.primary.withOpacity(0.05),
          splashColor: colorScheme.primary.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Food Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700, // Slightly bolder
                          color: colorScheme.onSurface,
                          letterSpacing: -0.5,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'PKR ${food.price.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        food.description,
                        style: TextStyle(
                          fontSize: 13,
                          color: colorScheme.onSurfaceVariant.withOpacity(0.8),
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                // Image with modern "Float" effect
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      food.imagePath,
                      height: 110, // Slightly larger for better detail
                      width: 110,
                      fit: BoxFit.cover,
                      // Error builder in case image is missing
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 110,
                        width: 110,
                        color: colorScheme.surfaceVariant,
                        child: Icon(Icons.fastfood_rounded, color: colorScheme.primary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Subtle thin divider
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            color: colorScheme.outlineVariant.withOpacity(0.3),
            thickness: 0.8,
            height: 1,
          ),
        ),
      ],
    );
  }
}