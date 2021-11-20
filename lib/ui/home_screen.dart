import 'package:flutter/material.dart';
import 'cart.dart';
import 'profile.dart';
import 'shopping.dart';

class HomeScreen extends StatefulWidget {
  final int index;
  HomeScreen({required String tab, Key? key})
      : index = indexFrom(tab),
        super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static int indexFrom(String tab) {
    switch (tab) {
      case 'cart':
        return 1;
      case 'profile':
        return 2;
      case 'shopping':
      default:
        return 0;
    }
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Navigator',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        backgroundColor: Colors.blue,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
 /*           switch (index) {
              case 0:
                context.go('/shop');
                // context.go('/root/shop');
                break;
              case 1:
                context.go('/cart');
                // context.go('/root/cart');
                break;
              case 2:
                context.go('/profile');
                // context.go('/root/profile');
                break;
            }
*/          });
        },
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [Shopping(), Cart(), Profile()],
      ),
    );
  }
}
