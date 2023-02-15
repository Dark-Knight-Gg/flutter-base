import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main/presentation/ui/domain/domain_cubit.dart';
import 'main/presentation/ui/domain/domain_page.dart';
import 'main/presentation/ui/login/login_cubit.dart';
import 'main/presentation/ui/login/login_page.dart';
import 'main/presentation/ui/splash/splash_cubit.dart';
import 'main/presentation/ui/splash/splash_page.dart';

enum Routes {
  root('/'),
  domain('/domain'),
  login('/login');

  final String path;

  const Routes(this.path);
}

Route onGenerateRoute(RouteSettings settings) {
  var routeSelected = Routes.values.firstWhere(
        (element) => settings.name == element.path,
    orElse: () => Routes.root,
  );
  switch (routeSelected) {
    case Routes.root:
      return MaterialPageRoute(
        builder: (context) =>
            BlocProvider<SplashCubit>(
              create: (context) => SplashCubit(context.read()),
              child: const SplashPage(),
            ),
      );
    case Routes.domain:
      return MaterialPageRoute(
        builder: (context) =>
            BlocProvider<DomainCubit>(
              create: (context) => DomainCubit(context.read()),
              child: const DomainPage(),
            ),
      );
    case Routes.login:
      return MaterialPageRoute(
        builder: (context) =>
            BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(),
              child: const LoginPage(),
            ),
      );
  }
}
