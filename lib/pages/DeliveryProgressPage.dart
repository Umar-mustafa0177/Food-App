import 'package:flutter/material.dart';
import 'package:mynew_project/components/my_receipt.dart';
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
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }
}
