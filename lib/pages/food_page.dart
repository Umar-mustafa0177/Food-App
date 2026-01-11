import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:mynew_project/components/my_button.dart';
import 'package:mynew_project/models/food.dart';
import 'package:mynew_project/models/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final Map<Addon, bool> selectedAddons = {};

  @override
  void initState() {
    super.initState();
    for (Addon addon in widget.food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);

    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addtoCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: colorScheme.surface,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Smooth Hero Image
                      Hero(
                        tag: widget.food.imagePath,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          child: Image.asset(
                            widget.food.imagePath,
                            width: double.infinity,
                            height: 350,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.food.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'PKR ${widget.food.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              widget.food.description,
                              style: TextStyle(
                                fontSize: 16,
                                color: colorScheme.onSurfaceVariant,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Divider(color: colorScheme.outlineVariant),
                            const SizedBox(height: 20),
                            Text(
                              "Add-ons",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),

                            // Customize Section
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: colorScheme.outlineVariant),
                              ),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: widget.food.availableAddons.length,
                                itemBuilder: (context, index) {
                                  Addon addon = widget.food.availableAddons[index];
                                  return CheckboxListTile(
                                    title: Text(addon.name),
                                    subtitle: Text('PKR ${addon.price}', style: TextStyle(color: colorScheme.primary)),
                                    activeColor: colorScheme.primary,
                                    value: selectedAddons[addon],
                                    onChanged: (bool? value) {
                                      HapticFeedback.lightImpact();
                                      setState(() {
                                        selectedAddons[addon] = value!;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Sticky Bottom Button
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: MyButton(
                    onTap: () => addToCart(widget.food, selectedAddons),
                    text: "Add to Cart",
                  ),
                ),
              ),
            ],
          ),
        ),

        // Back Button
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme.surface.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back_ios_new_rounded, color: colorScheme.onSurface, size: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}