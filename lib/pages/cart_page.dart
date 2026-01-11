import 'package:flutter/material.dart';
import 'package:mynew_project/components/my_button.dart';
import 'package:mynew_project/components/my_cart_tile.dart';
import 'package:mynew_project/models/restaurant.dart';
import 'package:mynew_project/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        return Scaffold(
          backgroundColor: colorScheme.surface,

          // 1. Modern Clean AppBar
          appBar: AppBar(
            title: const Text(
              'C A R T',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: colorScheme.onSurface,
            actions: [
              if (userCart.isNotEmpty)
                IconButton(
                  onPressed: () => _showClearCartDialog(context, restaurant),
                  icon: Icon(Icons.delete_sweep_rounded, color: colorScheme.primary),
                ),
            ],
          ),

          body: Column(
            children: [
              // 2. Cart Items List
              Expanded(
                child: userCart.isEmpty
                    ? _buildEmptyState(colorScheme)
                    : ListView.builder(
                  itemCount: userCart.length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 20),
                  itemBuilder: (context, index) {
                    final cartItem = userCart[index];
                    return MyCartTile(cartItem: cartItem);
                  },
                ),
              ),

              // 3. Premium Bottom Checkout Panel
              if (userCart.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 25,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Subtotal Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order Total",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              "PKR ${restaurant.getTotalPrice().toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),

                        // Action Button
                        MyButton(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PaymentPage()),
                          ),
                          text: "Checkout Now",
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // --- Helper Widgets ---

  Widget _buildEmptyState(ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shopping_basket_outlined,
              size: 100,
              color: colorScheme.primary.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Your cart is hungry!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Add some delicious items to get started.",
            style: TextStyle(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  void _showClearCartDialog(BuildContext context, Restaurant restaurant) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Clear Everything?"),
        content: const Text("Are you sure you want to remove all items from your cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Go Back"),
          ),
          TextButton(
            onPressed: () {
              restaurant.clearCart();
              Navigator.pop(context);
            },
            child: const Text("Yes, Clear", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          ),
        ],
      ),
    );
  }
}