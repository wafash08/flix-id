import "package:firebase_core/firebase_core.dart";
import "package:flix_id/firebase_options.dart";
import "package:flix_id/presentation/providers/logger_observer.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:google_fonts/google_fonts.dart";
import "package:logging/logging.dart";

import "presentation/misc/constants.dart";
import "presentation/providers/router_provider.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Logger.root.level = Level.INFO;
  runApp(
    ProviderScope(
      observers: [LoggerObserver(logger: Logger("FlixID"))],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData.from(
        useMaterial3: true,
        textTheme: TextTheme(
          // default font style
          bodyMedium: GoogleFonts.poppins(color: ghostWhite),
          // font in text field and its label
          bodyLarge: GoogleFonts.poppins(color: ghostWhite),
          // font in button
          labelLarge: GoogleFonts.poppins(color: ghostWhite),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: safron,
          surface: backgroundColor,
          brightness: Brightness.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}
