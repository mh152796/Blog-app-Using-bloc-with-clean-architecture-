import 'package:blog_app/core/app_routes/route_name.dart';
import 'package:go_router/go_router.dart';
import '../../feature/auth/presentation/pages/sign_in_page.dart';
import '../../feature/auth/presentation/pages/signup_page.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: RoutesName.signUpPage,
      path: '/sign_up',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: RoutesName.loginPage,
      path: '/', // Use a clean path
      builder: (context, state) => const LoginPage(),
    ),
  ],
);