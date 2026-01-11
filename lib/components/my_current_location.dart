import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  final TextEditingController _addressController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _addressController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _showLocationDialog() {
    HapticFeedback.lightImpact();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Theme.of(dialogContext).colorScheme.surface,
          elevation: 12,
          titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          actionsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),

          title: Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                color: Theme.of(dialogContext).colorScheme.primary,
                size: 28,
              ),
              const SizedBox(width: 12),
              const Text(
                "Delivery Location",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),

          content: TextField(
            controller: _addressController,
            focusNode: _focusNode,
            autofocus: true,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: "Enter your delivery address...",
              hintStyle: TextStyle(
                color: Theme.of(dialogContext).colorScheme.onSurfaceVariant,
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Theme.of(dialogContext).colorScheme.primary,
              ),
              filled: true,
              fillColor: Theme.of(dialogContext).colorScheme.surfaceVariant,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
            style: const TextStyle(fontSize: 16),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                _addressController.clear();
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(dialogContext).colorScheme.onSurfaceVariant,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: () {
                final newAddress = _addressController.text.trim();
                if (newAddress.isNotEmpty) {
                  context.read<Restaurant>().updateDeliveryAddress(newAddress);
                }
                Navigator.pop(dialogContext);
                _addressController.clear();
                HapticFeedback.mediumImpact();
              },
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(dialogContext).colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              ),
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Label
          Text(
            "DELIVER TO",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: colorScheme.primary,
              letterSpacing: 0.8,
            ),
          ),

          const SizedBox(height: 4),

          // Tap area
          GestureDetector(
            onTap: _showLocationDialog,
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: colorScheme.primary,
                    size: 22,
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: Consumer<Restaurant>(
                      builder: (context, restaurant, child) {
                        final address = restaurant.deliveryAddress;
                        final displayText = address.isEmpty
                            ? "Select delivery location..."
                            : address;

                        return Text(
                          displayText,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: address.isEmpty
                                ? colorScheme.onSurfaceVariant
                                : colorScheme.onSurface,
                            height: 1.3,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 8),

                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: colorScheme.primary,
                    size: 22,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}