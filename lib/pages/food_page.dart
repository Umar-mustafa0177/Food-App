import 'package:flutter/material.dart';
import 'package:mynew_project/models/food.dart';
import 'package:mynew_project/models/restaurant.dart';
class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage(
      {
        super.key, required this.food,
  });

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          //image at the top
          Image.asset(widget.food.imagePath),

          //food name
          Text(widget.food.name),


          //food description
          Text(widget.food.description),

          //addons
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.food.availableAddons.length,
            itemBuilder: (context, index) {

              //get individual addons
              Addon addon = widget.food.availableAddons[index];
              return CheckboxListTile(
              value: false,
              onChanged: (value) {},
            );

          },
          )



          //buttons => add to cart
        ],
      ),
    );
  }
}