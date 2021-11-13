import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/cart.dart';
import '../ui/shopping.dart';
import '../ui/profile.dart';
import '../ui/create_account.dart';
import '../ui/error_page.dart';
import '../ui/main_screen.dart';
import '../ui/more_info.dart';
import '../ui/payment.dart';
import '../ui/personal_info.dart';
import '../ui/signin_info.dart';
import '../constants.dart';
import '../login_state.dart';
import '../ui/login.dart';
import '../ui/details.dart';

const String homeRouteName = 'home';
const String personalRouteName = 'personal';
const String paymentRouteName = 'payment';
const String signinRouteName = 'signin';
const String moreInfoRouteName = 'moreInfo';
const String profileRouteName = 'profile';
const String cartRouteName = 'cart';
const String shoppingRouteName = 'shopping';
const String detailsRouteName = 'details';

class MyRouter {
  final LoginState loginState;

  MyRouter(this.loginState);

  late final router = GoRouter(
    refreshListenable: loginState,
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        name: loginRouteName,
        path: '/login',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const Login(),
        ),
      ),
      GoRoute(
        name: createAccountRouteName,
        path: '/create-account',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const CreateAccount(),
        ),
      ),
      GoRoute(
        name: homeRouteName,
        path: '/',
        redirect: (state) =>
            state.namedLocation(mainRouteName, params: {'index': '0'}),
      ),
      GoRoute(
        name: mainRouteName,
        path: '/main/:tab(shop|cart|profile)',
        pageBuilder: (context, state) {
          final index = state.queryParams['index'] ?? '0';
          return MaterialPage<void>(
            key: state.pageKey,
            child: MainScreen(index: index),
          );
        },
        routes: [
          GoRoute(
            name: shoppingRouteName,
            path: 'shopping',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const Shopping(),
            ),
            routes: [
              GoRoute(
                name: detailsPageName,
                path: ':item',
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: Builder(
                    builder: (context) {
                      return Details(description: state.params[item]!);
                    },
                  ),
                ),
              ),
            ],
          ),
          GoRoute(
            name: cartRouteName,
            path: 'cart',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const Cart(),
            ),
          ),
          GoRoute(
            name: profileRouteName,
            path: 'profile',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const Profile(),
            ),
            routes: [
              GoRoute(
                name: personalRouteName,
                path: 'personal',
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: const PersonalInfo(),
                ),
              ),
              GoRoute(
                name: paymentRouteName,
                path: 'payment',
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: const Payment(),
                ),
              ),
              GoRoute(
                name: signinRouteName,
                path: 'signin',
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: const SigninInfo(),
                ),
              ),
              GoRoute(
                name: moreInfoRouteName,
                path: 'more-info',
                pageBuilder: (context, state) => MaterialPage<void>(
                  key: state.pageKey,
                  child: const MoreInfo(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],

    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorPage(error: state.error),
    ),

    // redirect to the login page if the user is not logged in
    redirect: (state) {
      final loginLoc = state.namedLocation(loginRouteName);
      final loggingIn = state.subloc == loginLoc;
      final createAccountLoc = state.namedLocation(createAccountRouteName);
      final creatingAccount = state.subloc == createAccountLoc;
      final loggedIn = loginState.loggedIn;
      final homeLoc = state.namedLocation(mainRouteName);

      if (!loggedIn && !loggingIn && !creatingAccount) return loginLoc;
      if (loggedIn && (loggingIn || creatingAccount)) return homeLoc;
      return null;
    },
  );
}
