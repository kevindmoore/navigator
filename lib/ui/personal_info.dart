import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    final nameTextController = TextEditingController();
    final addressTextController = TextEditingController();
    final cityTextController = TextEditingController();
    final stateTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Personal Info',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), hintText: 'Name'),
                        controller: nameTextController),
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Address'),
                        controller: addressTextController),
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), hintText: 'City'),
                        controller: cityTextController),
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(), hintText: 'State'),
                        controller: stateTextController),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
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
          ],
        ),
      ),
    );
  }
}
