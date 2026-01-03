import 'package:flutter/material.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key});

  // Method to open the location search dialog
  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your location"),
        content: const TextField(
          decoration: InputDecoration(hintText: "Search address.."),
        ),
        actions: [
          //cancel Button
          MaterialButton(onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
          ),
  

          //save Button
          MaterialButton(onPressed: () => Navigator.pop(context),
            child: const Text("Save"),
          ),


        ],
      ),
    );
  }

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Deliver Now" text
          Text(
            "Deliver Now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.normal,
            ),
          ),

          const SizedBox(height: 5),

          // Address row with tap gesture
          GestureDetector(
            onTap: () => widget.openLocationSearchBox(context), // <-- fixed here
            child: Row(
              children: [
                // Address
                Text(
                  "6901 Rawalpindi si",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(width: 5),

                // Drop-down arrow icon
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
