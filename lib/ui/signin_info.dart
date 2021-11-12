import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_state.dart';

class SigninInfo extends StatefulWidget {
  const SigninInfo({Key? key}) : super(key: key);

  @override
  _SigninInfoState createState() => _SigninInfoState();
}

class _SigninInfoState extends State<SigninInfo> {
  TextEditingController password1TextController = TextEditingController();
  TextEditingController password2TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Signin Info',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Change Password',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'New Password'),
                        controller: password1TextController),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Type New Password Again'),
                        controller: password2TextController),
                  ),
                ],
              ),
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
                'Change Password',
                style: TextStyle(color: Colors.white),
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
              onPressed: () {
                saveLoginState(context);
              },
              child: const Text(
                'Sign Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveLoginState(BuildContext context) {
    Provider.of<LoginState>(context, listen: false).loggedIn = false;
    Navigator.pop(context);
  }
}
