import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:mynew_project/models/Cart_item.dart';

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
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Big Ben",
      description: "Double patty special burger",
      imagePath: "lib/images/burgers/big ben.png",
      price: 6.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Crunch",
      description: "Crunchy chicken fillet burger",
      imagePath: "lib/images/burgers/crunch.png",
      price: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Pattie",
      description: "Simple beef patty burger",
      imagePath: "lib/images/burgers/patie.png",
      price: 3.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Zinger",
      description: "Classic zinger burger",
      imagePath: "lib/images/burgers/zinger.png",
      price: 5.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    // ================= DESSERTS =================
    Food(
      name: "Gulab Jamun",
      description: "Soft sweet gulab jamun",
      imagePath: "lib/images/deserts/gulab jamun.png",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Jalebi",
      description: "Crispy sweet jalebi",
      imagePath: "lib/images/deserts/jalebi.png",
      price: 2.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Kheer",
      description: "Traditional rice kheer",
      imagePath: "lib/images/deserts/kheer.png",
      price: 3.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Ras Malai",
      description: "Milk based soft ras malai",
      imagePath: "lib/images/deserts/pngtree-bread-rasmalai-is-the-tweaked-version-of-traditional-png-image_13182378.png",
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Sohn Halwa",
      description: "Famous multani sohn halwa",
      imagePath: "lib/images/deserts/sohn halwa.png",
      price: 4.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    // ================= DRINKS =================
    Food(
      name: "Lassi",
      description: "Sweet chilled lassi",
      imagePath: "lib/images/drinks/lassi.png",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Lemon Pani",
      description: "Refreshing lemon drink",
      imagePath: "lib/images/drinks/lemon pani.png",
      price: 1.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Mint Margarita",
      description: "Mint fresh margarita",
      imagePath: "lib/images/drinks/mint margarita.png",
      price: 2.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Rooh Afza",
      description: "Classic rooh afza drink",
      imagePath: "lib/images/drinks/rooh afza.png",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    // ================= SALADS =================
    Food(
      name: "Macroni Salad",
      description: "Creamy macroni salad",
      imagePath: "lib/images/salads/macroni slad.png",
      price: 2.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Russian Salad",
      description: "Classic russian salad",
      imagePath: "lib/images/salads/russian salad.png",
      price: 3.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Vegetable Salad",
      description: "Fresh vegetable salad",
      imagePath: "lib/images/salads/salad 1.png",
      price: 2.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    // ================= SIDES =================
    Food(
      name: "Achar",
      description: "Traditional desi achar",
      imagePath: "lib/images/sides/achar.png",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Naan Roti",
      description: "Fresh naan roti",
      imagePath: "lib/images/sides/naan roti.png",
      price: 1.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Raita",
      description: "Cool yogurt raita",
      imagePath: "lib/images/sides/raita.png",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),

    Food(
      name: "Shami Kabab",
      description: "Juicy shami kabab",
      imagePath: "lib/images/sides/shami kabab.png",
      price: 2.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99)
      ],
    ),
  ];

  /*
  G E T T E R S
   */

  List <Food> get menu => _menu;
  List <CartItem> get cart => _cart;

/*
  OPERATIONS
   */

  //user cart
  final List<CartItem> _cart = [];

//add to cart
  void addtoCart(Food food, List<Addon>selectedAddons){
    //to see if the selected item is already in cart then update count only
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are same
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;

    });


    //if item already exists just increase count
    if (cartItem != null){
      cartItem.quantity++;
    }

    //otherwise add new cart item
    else {
      _cart.add(CartItem(food: food,
          selectedAddons: selectedAddons),
      );
    }

    notifyListeners();
  }

//flutter pub add collection



// remove from cart
  void removefromcart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }


// get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

//get total number of items
// get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }


//clear the cart
void clearCart(){
    _cart.clear();
    notifyListeners();
}



/*
  HELPERS
   */

//generate a receipt


//format doyble value into money



//fromat list of addons summmary to as string itme



}
