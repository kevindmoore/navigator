import 'package:flutter/cupertino.dart';

//ignore: must_be_immutable
class ErrorPage extends StatelessWidget {
  final Exception? error;
  late String message;

  ErrorPage({Key? key, this.error}) : super(key: key) {
    if (error != null) {
      message = error.toString();
    } else {
      message = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
