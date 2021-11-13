import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController creditCardController =
        MaskedTextController(mask: '0000 0000 0000 0000');
    final TextEditingController cvcController =
        MaskedTextController(mask: '000');
    final TextEditingController expirationController =
        MaskedTextController(mask: '00/00');

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Payment',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Credit Card'),
                        controller: creditCardController),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        maxLength: 5,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Expiration Date'),
                        controller: expirationController),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), hintText: 'CVC'),
                        controller: cvcController),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
