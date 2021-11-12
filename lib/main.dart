import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_holder.dart';
import 'package:provider/provider.dart';

import 'login_state.dart';
import 'router/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final state = LoginState(await SharedPreferences.getInstance());
  state.checkLoggedIn();
  runApp(MyApp(loginState: state));
}

class MyApp extends StatelessWidget {
  final LoginState loginState;

  const MyApp({Key? key, required this.loginState}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartHolder>(
          lazy: false,
          create: (_) => CartHolder(),
        ),
        ChangeNotifierProvider<LoginState>(
          lazy: false,
          create: (BuildContext createContext) => loginState,
        ),
        Provider<MyRouter>(
          lazy: false,
          create: (BuildContext createContext) => MyRouter(loginState),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final router = Provider.of<MyRouter>(context, listen: false).router;
          return MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            debugShowCheckedModeBanner: false,
            title: 'Navigation App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
