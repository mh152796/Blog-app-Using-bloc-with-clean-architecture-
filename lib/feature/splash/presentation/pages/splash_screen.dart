import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/common/widgets/loader.dart';
import 'package:blog_app/feature/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      if (mounted) {
        final userState = context.read<AppUserCubit>().state;
         if (userState is AppUserLoggedIn) {
          context.go(RoutesName.blogPage);
        } else {
          context.go(RoutesName.loginPage);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Loader();
  }
}
