import 'package:flutter/material.dart';
import 'package:mynew_project/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Stack(
        children: [
          // --- Main Ticket Container ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ticket Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ORDER DETAILS",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Invoice #5521",
                          style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
                        ),
                      ],
                    ),
                    Icon(Icons.receipt_long_rounded, color: colorScheme.primary, size: 28),
                  ],
                ),

                const SizedBox(height: 25),

                // --- Stylized Receipt Body ---
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: colorScheme.secondary.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.3)),
                  ),
                  child: Consumer<Restaurant>(
                    builder: (context, restaurant, child) {
                      return Text(
                        restaurant.displayCartReceipt(),
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.8,
                          fontFamily: 'monospace', // Pro look
                          color: colorScheme.onSurface,
                          letterSpacing: 0.5,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),

                // --- Dashed Line (Modern Divider) ---
                Row(
                  children: List.generate(
                    20,
                        (index) => Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 1.5,
                        color: index % 2 == 0
                            ? colorScheme.outlineVariant.withOpacity(0.5)
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Footer Message
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "Estimated Time: 20-30 Mins",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Thank you for choosing us!",
                        style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- Side Notches (Ticket "Cut" Effect) ---
          // Left Notch
          Positioned(
            left: -15,
            top: 250, // Divider ke barabar set karein
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: colorScheme.surface, // Page background se match karega
                shape: BoxShape.circle,
                border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.5)),
              ),
            ),
          ),

          // Right Notch
          Positioned(
            right: -15,
            top: 250,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                shape: BoxShape.circle,
                border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}