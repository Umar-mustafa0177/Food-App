import 'package:flutter/material.dart';
import 'package:mynew_project/models/food.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // food image
          Image.asset(widget.food.imagePath),

          // food name
          Text(widget.food.name),

          // food description
          Text(widget.food.description),



          // addons

          ListView.builder(
            shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.food.availableAddons.length, itemBuilder: (context, index){
            return CheckboxListTile(value: false, onChanged: (value){

            },
            );
          })

          // button
        ],
      ),
    );
  }
}
