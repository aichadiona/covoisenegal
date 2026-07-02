import 'package:covoisenegal/core/network/storage/secure_storage.dart';
import 'package:covoisenegal/features/auth/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

final storage = SecureStorage();

final GoRouter router = GoRouter(
  initialLocation: '/splash',

  redirect: (context, state) async {
    final token = await storage.getToken();

    final isAuth = token != null && token.isNotEmpty;

    final goingToLogin = state.matchedLocation == '/login';

    if (!isAuth) {
      return goingToLogin ? null : '/login';
    }

    if (isAuth && goingToLogin) {
      return '/home';
    }

    return null;
  },

  routes: [
    // GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    // GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  ],
);
