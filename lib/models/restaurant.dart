//flutter pub add intl
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' show DateFormat;
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
      price: 499,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese ", price: 99),
        Addon(name: "Jalpenos", price: 149),
        Addon(name: "Garlic Mayo Sauce", price: 199)
      ],
    ),

    Food(
      name: "Big Ben",
      description: "Double patty special burger",
      imagePath: "lib/images/burgers/big ben.png",
      price: 899,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese ", price: 99),
        Addon(name: "Jalpenos", price: 149),
        Addon(name: "Garlic Mayo Sauce", price: 199)
      ],
    ),

    Food(
      name: "Crunch",
      description: "Crunchy chicken fillet burger",
      imagePath: "lib/images/burgers/crunch.png",
      price: 450,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese ", price: 99),
        Addon(name: "Jalpenos", price: 149),
        Addon(name: "Garlic Mayo Sauce", price: 199)
      ],
    ),

    Food(
      name: "Pattie",
      description: "Simple beef patty burger",
      imagePath: "lib/images/burgers/patie.png",
      price: 699,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese ", price: 99),
        Addon(name: "Jalpenos", price: 149),
        Addon(name: "Garlic Mayo Sauce", price: 199)
      ],
    ),

    Food(
      name: "Zinger",
      description: "Classic zinger burger",
      imagePath: "lib/images/burgers/zinger.png",
      price: 799,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese ", price: 99),
        Addon(name: "Jalpenos", price: 149),
        Addon(name: "Garlic Mayo Sauce", price: 199)
      ],
    ),

    // ================= DESSERTS =================
    Food(
      name: "Gulab Jamun",
      description: "Soft sweet gulab jamun",
      imagePath: "lib/images/deserts/gulab jamun.png",
      price: 1200,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Sugar Syrup", price: 99),
        Addon(name: "Khoya Crumble", price: 149),
        Addon(name: "Dry Fruits Badam / Pista", price: 199)
      ],
    ),

    Food(
      name: "Jalebi",
      description: "Crispy sweet jalebi",
      imagePath: "lib/images/deserts/jalebi.png",
      price: 700,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Rabri", price: 99),
        Addon(name: "Extra Sugar Syrup", price: 149),
        Addon(name: "Pista / Badam", price: 199)
      ],
    ),

    Food(
      name: "Kheer",
      description: "Traditional rice kheer",
      imagePath: "lib/images/deserts/kheer.png",
      price: 500,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Badam / Pista / Kishmish", price: 99),
        Addon(name: "Fresh Cream / Malai", price: 149),
        Addon(name: "Elaichi Powder", price: 199)
      ],
    ),

    Food(
      name: "Ras Malai",
      description: "Milk based soft ras malai",
      imagePath: "lib/images/deserts/pngtree-bread-rasmalai-is-the-tweaked-version-of-traditional-png-image_13182378.png",
      price: 1399,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Badam / Pista / Kishmish", price: 99),
        Addon(name: "Fresh Cream / Malai", price: 149),
        Addon(name: "Elaichi Powder", price: 199)
      ],
    ),

    Food(
      name: "Sohn Halwa",
      description: "Famous multani sohn halwa",
      imagePath: "lib/images/deserts/sohn halwa.png",
      price: 2500,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Badam / Pista / Kishmish", price: 99),
        Addon(name: "Fresh Cream / Malai", price: 149),
        Addon(name: "Elaichi Powder", price: 199)
      ],
    ),

    // ================= DRINKS =================
    Food(
      name: "Lassi",
      description: "Sweet chilled lassi",
      imagePath: "lib/images/drinks/lassi.png",
      price: 280,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Malai", price: 50),
        Addon(name: "Dry fruits", price: 100),
        Addon(name: "Rose syrup", price: 150)
      ],
    ),

    Food(
      name: "Lemon Pani",
      description: "Refreshing lemon drink",
      imagePath: "lib/images/drinks/lemon pani.png",
      price: 120,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint", price: 50),
        Addon(name: "Black Salt", price: 50),
        Addon(name: "Soda", price: 100)
      ],
    ),

    Food(
      name: "Mint Margarita",
      description: "Mint fresh margarita",
      imagePath: "lib/images/drinks/mint margarita.png",
      price: 180,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint", price: 50),
        Addon(name: "Black Salt", price: 50),
        Addon(name: "Soda", price: 100)
      ],
    ),

    Food(
      name: "Rooh Afza",
      description: "Classic rooh afza drink",
      imagePath: "lib/images/drinks/rooh afza.png",
      price: 120,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Milk", price: 50),
        Addon(name: "Ice cream scoop", price: 100),
        Addon(name: "Basil Seeds", price: 50)
      ],
    ),

    // ================= SALADS =================
    Food(
      name: "Macroni Salad",
      description: "Creamy macroni salad",
      imagePath: "lib/images/salads/macroni slad.png",
      price: 399,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 100),
        Addon(name: "Nuts & Seeds", price: 150),
        Addon(name: "Extra Sauce", price: 200)
      ],
    ),

    Food(
      name: "Russian Salad",
      description: "Classic russian salad",
      imagePath: "lib/images/salads/russian salad.png",
      price: 399,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 100),
        Addon(name: "Nuts & Seeds", price: 150),
        Addon(name: "Extra Sauce", price: 200)
      ],
    ),

    Food(
      name: "Vegetable Salad",
      description: "Fresh vegetable salad",
      imagePath: "lib/images/salads/salad 1.png",
      price: 250,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 100),
        Addon(name: "Nuts & Seeds", price: 150),
        Addon(name: "Extra Sauce", price: 200)
      ],
    ),

    // ================= SIDES =================
    Food(
      name: "Achar",
      description: "Traditional desi achar",
      imagePath: "lib/images/sides/achar.png",
      price: 200,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Chilli", price: 100),
        Addon(name: "Mango", price: 100),
        Addon(name: "Garlic", price: 100)
      ],
    ),

    Food(
      name: "Naan Roti",
      description: "Fresh naan roti",
      imagePath: "lib/images/sides/naan roti.png",
      price: 50,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Butter", price: 50),
        Addon(name: "Garlic", price: 50),
        Addon(name: "Cheese Stuffing", price: 50)
      ],
    ),

    Food(
      name: "Raita",
      description: "Cool yogurt raita",
      imagePath: "lib/images/sides/raita.png",
      price: 80,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cucumber", price: 50),
        Addon(name: "Coriander", price: 50),
        Addon(name: "Spicies", price: 50)
      ],
    ),

    Food(
      name: "Shami Kabab",
      description: "Juicy shami kabab",
      imagePath: "lib/images/sides/shami kabab.png",
      price: 100,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Chicken", price: 50),
        Addon(name: "Beaf", price: 50),
        Addon(name: "Meat", price: 50)
      ],
    ),
  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address which user can add manuauly
  String _deliveryAddress = '99 Hopllywood b19';

  /*
  G E T T E R S
   */

  List <Food> get menu => _menu;
  List <CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;





/*
  OPERATIONS
   */





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


//upadte the delviery address
  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
      }


/*
  HELPERS
   */

// generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");


    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("    Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");


    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");
    return receipt.toString();

  }




// format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }

}
