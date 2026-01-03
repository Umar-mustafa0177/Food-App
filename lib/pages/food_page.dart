import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mynew_project/components/my_button.dart';
import 'package:mynew_project/models/food.dart';
import 'package:mynew_project/models/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final Map<Addon, bool> selectedAddons = {};

  @override
  void initState() {
    super.initState();
    // initialize selected addons to false
    for (Addon addon in widget.food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  // method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {

    //close the current page to go back
    Navigator.pop(context);


    //format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    //add to cart
    context
        .read<Restaurant>()
        .addtoCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(widget.food.imagePath),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'PKR ${widget.food.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color:
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(widget.food.description),
                      const SizedBox(height: 10),
                      Divider(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Add-ons",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .inversePrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary,
                          ),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics:
                          const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount:
                          widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            Addon addon =
                            widget.food.availableAddons[index];

                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                'PKR ${addon.price}',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary,
                                ),
                              ),
                              value: selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  selectedAddons[addon] =
                                  value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                MyButton(
                  onTap: () {
                    addToCart(
                        widget.food, selectedAddons);
                  },
                  text: "Add to Cart",
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.5,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                    Icons.arrow_back_ios_new),
                onPressed: () =>
                    Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
