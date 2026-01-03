import 'package:flutter/material.dart';
import 'package:mynew_project/components/my_button.dart';
import 'package:mynew_project/models/food.dart';
import 'package:mynew_project/models/restaurant.dart';
class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> SelectedAddons = {};

  FoodPage(
      {
        super.key, required this.food,
  }){
    //initialize selected addons to be false
    for(Addon addon in food.availableAddons){
      SelectedAddons[addon] = false;

    }

  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scalfod UI
     Scaffold(
    body: SingleChildScrollView(
    child: Column(
    children: [

    //image at the top
    Image.asset(widget.food.imagePath),

    Padding(
    padding: const EdgeInsets.all(25.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
    //food name
    Text(widget.food.name, style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20),
    ),

    //price
    Text('\PKR '+widget.food.price.toString(), style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Theme.of(context).colorScheme.primary),
    ),

    const SizedBox(height: 10),


    //food description
    Text(widget.food.description
    ),

    const SizedBox(height: 10),

    Divider(color: Theme.of(context).colorScheme.secondary),
    const SizedBox(height: 10),

    //addons
    Text(
    "Add-ons", style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.inversePrimary
    ),
    ),

    const SizedBox(height: 10),

    Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: Theme.of(context).colorScheme.secondary)

    ),
    child: ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: widget.food.availableAddons.length,
    itemBuilder: (context, index) {

    //get individual addons
    Addon addon = widget.food.availableAddons[index];
    //return checkbox ui
    return CheckboxListTile(
    title: Text(addon.name),
    subtitle: Text('\PKR ${addon.price}', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
    value: widget.SelectedAddons[addon],
    onChanged: (bool?value) {
    setState(() {
    widget.SelectedAddons[addon] = value! ;
    });
    },
    );

    },
    ),
    )
    ],
    ),
    ),
    //buttons => add to cart
    MyButton(onTap: (){},
    text: "Add to Cart",),


    const SizedBox(height: 25),
    ],
    ),
    ),
    ),



        // back button
    SafeArea(
      child: Opacity(
        opacity: 0.5 ,
        child: Container(
          margin: EdgeInsets.only(left: 25),
        decoration:  BoxDecoration(color: Theme.of(context).colorScheme.secondary,shape: BoxShape.circle),
        child: IconButton(icon: Icon(Icons.arrow_back_ios_new),
        onPressed: () => Navigator.pop(context),
        ),
        ),
      ),
    ),

    ],
    );
  }
}