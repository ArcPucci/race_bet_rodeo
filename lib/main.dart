import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:race_bet_rodeo/screens/screens.dart';

void main() {
  runZonedGuarded(() {
    runApp(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return const MyApp();
        },
      ),
    );
  }, (error, stack) {
    debugPrint(error.toString());
    debugPrintStack(stackTrace: stack);
  });
}

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/welcome',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const WelcomeScreen(),
            );
          },
        ),
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const MainScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'settings',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const SettingsScreen(),
                );
              },
            ),
            GoRoute(
              path: 'shop',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const ShopScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'bg',
                  pageBuilder: (context, state) {
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: const BackgroundsScreen(),
                    );
                  },
                ),
                GoRoute(
                  path: 'riders',
                  pageBuilder: (context, state) {
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: const RiderSkinsScreen(),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: 'race',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const RaceScreen(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
