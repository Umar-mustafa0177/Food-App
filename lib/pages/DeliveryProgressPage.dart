import 'package:flutter/material.dart';
import 'package:mynew_project/components/my_receipt.dart';
import 'package:mynew_project/services/database/firestore.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';

class Deliveryprogresspage extends StatefulWidget {
  const Deliveryprogresspage({super.key});

  @override
  State<Deliveryprogresspage> createState() => _DeliveryprogresspageState();
}

class _DeliveryprogresspageState extends State<Deliveryprogresspage> {
  final FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final receipt = context.read<Restaurant>().displayCartReceipt();
      await db.saveOrderToDatabase(receipt);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text("T R A C K  O R D E R",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: colorScheme.onSurface,
      ),
      // Fixed Driver Panel with better Contrast
      bottomNavigationBar: _buildDriverPanel(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 1. Animated Logo/Header (Jo aapko pasand aaya tha)
            TweenAnimationBuilder(
              duration: const Duration(seconds: 1),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: child,
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.celebration_rounded, size: 60, color: colorScheme.primary),
                  ),
                  const SizedBox(height: 15),
                  const Text("Order Placed Successfully!",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                ],
              ),
            ),

            // 2. Modernized Receipt
            const MyReceipt(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- REFINED DRIVER PANEL (Better Contrast) ---
  Widget _buildDriverPanel(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 120,
      margin: const EdgeInsets.all(15), // Floating effect
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: colorScheme.surface, // Background match
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Driver Profile Pic
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.primary, width: 2),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: colorScheme.secondary,
              child: Icon(Icons.person, color: colorScheme.primary),
            ),
          ),

          const SizedBox(width: 15),

          // Name & Status
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Arsalan Khan",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  "Your Delivery Hero",
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons (Contrast Fix)
          Row(
            children: [
              _buildActionButton(Icons.message_rounded, colorScheme.primary, colorScheme),
              const SizedBox(width: 10),
              _buildActionButton(Icons.call_rounded, Colors.green, colorScheme),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color iconColor, ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant, // Modern dark/light neutral color
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }
}