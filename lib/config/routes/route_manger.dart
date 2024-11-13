import 'package:go_router/go_router.dart';
import 'package:kharazah/config/routes/routes.dart';
import 'package:kharazah/features/home_screen/presentation/pages/home_screen.dart';

import '../../features/auth/login_screen/presentation/pages/login_screen.dart';
import '../../features/splash_screen/presentation/pages/make_cake.dart';
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
      path: Routes.homeScreenRoute,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: Routes.bakingPageRoute,
      builder: (context, state) => BakingPage(),
    ),
  ],
);

