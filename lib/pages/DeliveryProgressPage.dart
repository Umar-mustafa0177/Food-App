import 'package:flutter/material.dart';

class Deliveryprogresspage extends StatefulWidget {
  const Deliveryprogresspage({super.key});

  @override
  State<Deliveryprogresspage> createState() => _DeliveryprogresspageState();
}

class _DeliveryprogresspageState extends State<Deliveryprogresspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in progress"),
      ),
    );
  }
}
