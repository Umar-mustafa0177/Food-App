import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynew_project/components/my_quantity_selector.dart';
import 'package:mynew_project/models/Cart_item.dart';
import 'package:mynew_project/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(20), // More modern curvature
            border: Border.all(
              color: colorScheme.outlineVariant.withOpacity(0.5),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Food Image - Professional Squircle shape
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        cartItem.food.imagePath,
                        height: 85,
                        width: 85,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Info Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.food.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.4,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'PKR ${cartItem.food.price.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Quantity Selector moved here for better thumb reach
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              QuantitySelector(
                                quantity: cartItem.quantity,
                                food: cartItem.food,
                                onDecrement: () {
                                  HapticFeedback.lightImpact();
                                  restaurant.removefromcart(cartItem);
                                },
                                onIncrement: () {
                                  HapticFeedback.mediumImpact();
                                  restaurant.addtoCart(
                                    cartItem.food,
                                    cartItem.selectedAddons,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Addons Chips Section
              if (cartItem.selectedAddons.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.03),
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                  child: SizedBox(
                    height: 32,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cartItem.selectedAddons.length,
                      itemBuilder: (context, index) {
                        final addon = cartItem.selectedAddons[index];
                        return Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: colorScheme.primary.withOpacity(0.15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "+ ${addon.name}",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}