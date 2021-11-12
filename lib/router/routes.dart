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

const String loginRoute = '/login';
const String createAccountRoute = '/create_account';
const String homeRoute = '/';
const String mainPageRoute = '/main/:index';
const String personalPageRoute = 'personal';
const String paymentPageRoute = 'payment';
const String signinInfoPageRoute = 'signin';
const String moreInfoPageRoute = 'moreInfo';
const String profilePageRoute = 'profile';
const String cartPageRoute = 'cart';
const String shoppingPageRoute = 'shopping';
const String detailsPageRouteName = 'details';
const String detailsPageRoute = '/details/:item';

class MyRouter {
  final LoginState loginState;

  MyRouter(this.loginState);

  late final router = GoRouter(
    initialLocation: homeRoute,
    refreshListenable: loginState,
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        name: loginPage,
        path: loginRoute,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const Login(),
        ),
      ),
      GoRoute(
        name: createAccountPage,
        path: createAccountRoute,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const CreateAccount(),
        ),
      ),
      GoRoute(
        path: homeRoute,
        redirect: (_) => '/main/0',
      ),
      GoRoute(
          name: mainPage,
          path: mainPageRoute,
          pageBuilder: (context, state) {
            final index = state.params['index']!;
            return MaterialPage<void>(
              key: state.pageKey,
              child: MainScreen(index: index),
            );
          },
          routes: [
            GoRoute(
              name: shoppingPage,
              path: shoppingPageRoute,
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: const Shopping(),
              ),
            ),
            GoRoute(
              name: cartPage,
              path: cartPageRoute,
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: const Cart(),
              ),
            ),
            GoRoute(
                name: profilePage,
                path: profilePageRoute,
                pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: const Profile(),
                    ),
                routes: [
                  GoRoute(
                    name: personalPage,
                    path: personalPageRoute,
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: const PersonalInfo(),
                    ),
                  ),
                  GoRoute(
                    name: paymentPage,
                    path: paymentPageRoute,
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: const Payment(),
                    ),
                  ),
                  GoRoute(
                    name: signinInfoPage,
                    path: signinInfoPageRoute,
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: const SigninInfo(),
                    ),
                  ),
                  GoRoute(
                    name: moreInfoPage,
                    path: moreInfoPageRoute,
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: const MoreInfo(),
                    ),
                  ),
                ]),
          ]),
      GoRoute(
        name: detailsPage,
        path: detailsPageRoute,
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

    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorPage(error: state.error),
    ),

    // redirect to the login page if the user is not logged in
    redirect: (state) {
      if ((state.location == loginRoute ||
              state.location == createAccountRoute) &&
          !loginState.loggedIn) {
        return null;
      }
      if (!loginState.loggedIn) {
        return loginRoute;
      }
      if ((state.location == loginRoute ||
              state.location == createAccountRoute) &&
          loginState.loggedIn) {
        return homeRoute;
      }
      return null;
    },
  );
}
