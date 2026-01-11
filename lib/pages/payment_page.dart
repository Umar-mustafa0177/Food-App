import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mynew_project/components/my_button.dart';
import 'package:mynew_project/pages/DeliveryProgressPage.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Holder: $cardHolderName"),
                const SizedBox(height: 5),
                Text("Card Number: $cardNumber"),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Deliveryprogresspage(),
                  ),
                );
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text("C H E C K O U T"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Credit Card Preview
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: colorScheme.primary,
              onCreditCardWidgetChange: (p0) {},
            ),

            const SizedBox(height: 20),

            // Credit Card Form wrapped in Theme for color customization
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: colorScheme.primary,
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: colorScheme.primary, // cursor color
                  selectionColor: colorScheme.primary.withOpacity(0.3),
                  selectionHandleColor: colorScheme.primary,
                ),
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: colorScheme.onSurface), // text labels
                  hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.7)),
                ),
              ),
              child: CreditCardForm(
                formKey: formKey,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                onCreditCardModelChange: (data) {
                  setState(() {
                    cardNumber = data.cardNumber;
                    expiryDate = data.expiryDate;
                    cardHolderName = data.cardHolderName;
                    cvvCode = data.cvvCode;
                    isCvvFocused = data.isCvvFocused;
                  });
                },
              ),
            ),


            const SizedBox(height: 80), // Space before button

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: MyButton(
                onTap: userTappedPay,
                text: "Pay Now",
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
