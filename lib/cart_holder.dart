
import 'package:flutter/foundation.dart';

class CartHolder extends ChangeNotifier {
  final cartItems = <String>[];

  void addItem(String item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    cartItems.add(item);
    notifyListeners();
  }

  void clear() {
    cartItems.clear();
    notifyListeners();
  }
}