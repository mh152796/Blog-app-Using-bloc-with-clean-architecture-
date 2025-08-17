import 'package:blog_app/core/app_routes/route_name.dart';
import 'package:blog_app/feature/blog/domain/entities/blog_entity.dart';
import 'package:blog_app/feature/blog/presentation/pages/blog_viewer_page.dart';
import 'package:blog_app/feature/splash/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';
import '../../feature/auth/presentation/pages/sign_in_page.dart';
import '../../feature/auth/presentation/pages/signup_page.dart';
import '../../feature/blog/presentation/pages/add_new_blog_page.dart';
import '../../feature/blog/presentation/pages/blog_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutesName.splashScreen,
  routes: [
    GoRoute(
      path: RoutesName.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutesName.signUpPage,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: RoutesName.loginPage,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RoutesName.blogPage,
      builder: (context, state) => const BlogPage(),
    ),
    GoRoute(
      path: RoutesName.addNewBlogPage,
      builder: (context, state) => const AddNewBlogPage(),
    ),
    GoRoute(
      path: RoutesName.blogViewerPage,
      builder: (context, state) {
        final blog = state.extra as BlogEntity; // cast to your model
        return BlogViewerPage(blog: blog);
      },
    ),
  ],
);
