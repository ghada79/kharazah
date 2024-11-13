import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kharazah/config/di/di.dart';
import 'package:kharazah/config/routes/routes.dart';
import 'package:kharazah/features/baking_page/presentation/pages/baking_page.dart';
import 'package:kharazah/features/home_screen/presentation/pages/home_screen.dart';
import 'package:kharazah/features/main_lay_out/presentation/manager/main_layout_cubit.dart';
import 'package:kharazah/features/main_lay_out/presentation/pages/main_lay_out.dart';
import 'package:kharazah/features/profile_screen/presentation/pages/profile_screen.dart';
import 'package:kharazah/features/settings_screen/presentation/pages/settings_screen.dart';

import '../../features/auth/login_screen/presentation/pages/login_screen.dart';
import '../../features/splash_screen/presentation/pages/splash_screen.dart';


final getRouter = GoRouter(
  initialLocation: Routes.splashRoute,
  routes: [
    GoRoute(
      path: Routes.splashRoute,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.loginRoute,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: Routes.mainLayOut,
      builder: (context, state) =>
          BlocProvider(
            create: (context) => getIt<MainLayoutCubit>(),
            child: MainLayOut(),
          ),
    ),
    GoRoute(
      path: Routes.homeScreenRoute,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: Routes.bakingRoute,
      builder: (context, state) => BakingPage(),
    ),
    GoRoute(
      path: Routes.profileRoute,
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: Routes.settingsRoute,
      builder: (context, state) => SettingsScreen(),
    ),
  ],
);

