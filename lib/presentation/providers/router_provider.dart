import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../pages/login_page.dart";
import "../pages/main_page.dart";

part "router_provider.g.dart";

@Riverpod(keepAlive: true)
Raw<GoRouter> router(Ref ref) => GoRouter(
  routes: [
    GoRoute(
      path: "/main",
      name: "main",
      builder: (context, state) {
        return const MainPage();
      },
    ),
    GoRoute(
      path: "/login",
      name: "login",
      builder: (context, state) {
        return const LoginPage();
      },
    ),
  ],
  initialLocation: "/login",
  debugLogDiagnostics: false,
);
