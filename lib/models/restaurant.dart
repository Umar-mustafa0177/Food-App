import 'package:flutter/widgets.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{
  // list of food menu
  final List<Food> _menu = [

    // ================= BURGERS =================
    Food(
      name: "Bazinga",
      description: "Spicy crispy chicken burger",
      imagePath: "lib/images/burgers/bazinga.png",
      price: 5.99,
      category: FoodCategory.burgers,
      availableAddons: [],
    ),

    Food(
      name: "Big Ben",
      description: "Double patty special burger",
      imagePath: "lib/images/burgers/big ben.png",
      price: 6.99,
      category: FoodCategory.burgers,
      availableAddons: [],
    ),

    Food(
      name: "Crunch",
      description: "Crunchy chicken fillet burger",
      imagePath: "lib/images/burgers/crunch.png",
      price: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [],
    ),

    Food(
      name: "Pattie",
      description: "Simple beef patty burger",
      imagePath: "lib/images/burgers/patie.png",
      price: 3.99,
      category: FoodCategory.burgers,
      availableAddons: [],
    ),

    Food(
      name: "Zinger",
      description: "Classic zinger burger",
      imagePath: "lib/images/burgers/zinger.png",
      price: 5.49,
      category: FoodCategory.burgers,
      availableAddons: [],
    ),

    // ================= DESSERTS =================
    Food(
      name: "Gulab Jamun",
      description: "Soft sweet gulab jamun",
      imagePath: "lib/images/deserts/gulab jamun.png",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),

    Food(
      name: "Jalebi",
      description: "Crispy sweet jalebi",
      imagePath: "lib/images/deserts/jalebi.png",
      price: 2.49,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),

    Food(
      name: "Kheer",
      description: "Traditional rice kheer",
      imagePath: "lib/images/deserts/kheer.png",
      price: 3.49,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),

    Food(
      name: "Ras Malai",
      description: "Milk based soft ras malai",
      imagePath: "lib/images/deserts/pngtree-bread-rasmalai-is-the-tweaked-version-of-traditional-png-image_13182378.png",
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),

    Food(
      name: "Sohn Halwa",
      description: "Famous multani sohn halwa",
      imagePath: "lib/images/deserts/sohn halwa.png",
      price: 4.49,
      category: FoodCategory.desserts,
      availableAddons: [],
    ),

    // ================= DRINKS =================
    Food(
      name: "Lassi",
      description: "Sweet chilled lassi",
      imagePath: "lib/images/drinks/lassi.png",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),

    Food(
      name: "Lemon Pani",
      description: "Refreshing lemon drink",
      imagePath: "lib/images/drinks/lemon pani.png",
      price: 1.49,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),

    Food(
      name: "Mint Margarita",
      description: "Mint fresh margarita",
      imagePath: "lib/images/drinks/mint margarita.png",
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),

    Food(
      name: "Rooh Afza",
      description: "Classic rooh afza drink",
      imagePath: "lib/images/drinks/rooh afza.png",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),

    // ================= SALADS =================
    Food(
      name: "Macroni Salad",
      description: "Creamy macroni salad",
      imagePath: "lib/images/salads/macroni slad.png",
      price: 2.99,
      category: FoodCategory.salads,
      availableAddons: [],
    ),

    Food(
      name: "Russian Salad",
      description: "Classic russian salad",
      imagePath: "lib/images/salads/russian salad.png",
      price: 3.49,
      category: FoodCategory.salads,
      availableAddons: [],
    ),

    Food(
      name: "Vegetable Salad",
      description: "Fresh vegetable salad",
      imagePath: "lib/images/salads/salad 1.png",
      price: 2.49,
      category: FoodCategory.salads,
      availableAddons: [],
    ),

    // ================= SIDES =================
    Food(
      name: "Achar",
      description: "Traditional desi achar",
      imagePath: "lib/images/sides/achar.png",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [],
    ),

    Food(
      name: "Naan Roti",
      description: "Fresh naan roti",
      imagePath: "lib/images/sides/naan roti.png",
      price: 1.49,
      category: FoodCategory.sides,
      availableAddons: [],
    ),

    Food(
      name: "Raita",
      description: "Cool yogurt raita",
      imagePath: "lib/images/sides/raita.png",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [],
    ),

    Food(
      name: "Shami Kabab",
      description: "Juicy shami kabab",
      imagePath: "lib/images/sides/shami kabab.png",
      price: 2.99,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
  ];

  /*
  G E T T E R S
   */

List <Food> get menu => _menu;

/*
  OPERATIONS
   */

//add to cart



// remove from cart


//get toptal price of the cart


//get total number of items

//clear the cart




/*
  HELPERS
   */

//generate a receipt


//format doyble value into money



//fromat list of addons summmary to as string itme



}
