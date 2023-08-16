import 'package:catalogue/app/views/pages/home/about/about_page.dart';
import 'package:go_router/go_router.dart';

import '../views/pages/auth/password_reset/forgot_confirm_page.dart';
import '../views/pages/auth/password_reset/forgot_password_page.dart';
import '../views/pages/auth/sign_in_page.dart';
import '../views/pages/auth/sign_up_page.dart';
import '../views/pages/home/budget/budget_page.dart';
import '../views/pages/home/config/config_page.dart';
import '../views/pages/home/home_page.dart';
import '../views/pages/introduction/entry_page/entry_page.dart';
import '../views/pages/introduction/intro_page/intro_page.dart';

List<GoRoute> appRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const IntroPage(),
  ),
  GoRoute(
    path: '/entry',
    builder: (context, state) => const EntryPage(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const SignInPage(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const SignUpPage(),
  ),
  GoRoute(
    path: '/forgot',
    builder: (context, state) => const ForgotPasswordPage(),
  ),
  GoRoute(
    path: '/forgotconfirm',
    builder: (context, state) => const ForgotPageConfirm(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/about',
    builder: (context, state) => const AboutPage(),
  ),
  GoRoute(
    path: '/budget',
    builder: (context, state) => const BudgetPage(),
  ),
  GoRoute(
    path: '/config',
    builder: (context, state) => const ConfigPage(),
  ),
];
