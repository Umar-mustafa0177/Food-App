import 'package:flutter/material.dart';
import 'package:mynew_project/components/my_receipt.dart';
import 'package:mynew_project/services/database/firestore.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';

class Deliveryprogresspage extends StatefulWidget {
  const Deliveryprogresspage({super.key});

  @override
  State<Deliveryprogresspage> createState() => _DeliveryprogresspageState();
}

class _DeliveryprogresspageState extends State<Deliveryprogresspage> {
  // Firestore service instance
  final FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    // Use post-frame callback to safely access Provider after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Get receipt from Restaurant provider
      final receipt = context.read<Restaurant>().displayCartReceipt();

      // Save to Firestore
      await db.saveOrderToDatabase(receipt);

      // Optional: show a snackbar confirmation
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Order submitted successfully!")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Delivery Progress"),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          // Display the receipt
          MyReceipt(),
        ],
      ),
    );
  }
}
