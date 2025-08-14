import "package:firebase_core/firebase_core.dart";
import "package:flix_id/firebase_options.dart";
import "package:flix_id/presentation/pages/login_page.dart";
import "package:flix_id/presentation/providers/logger_observer.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:logging/logging.dart";

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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      // Scaffold(body: Center(child: Text("Hello World!"))),
    );
  }
}
