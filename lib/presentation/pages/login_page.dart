import "package:flix_id/presentation/pages/main_page.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../domain/usecases/login.dart";
import "../providers/usecases/login_provider.dart";

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final Login login = ref.watch(loginProvider);

            final result = await login.execute(
              LoginParams(email: "jimmy.butler@gmail.com", password: "123456"),
            );
            if (result.isSuccess) {
              if (!context.mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainPage(user: result.value!);
                  },
                ),
              );
            } else {
              if (!context.mounted) return;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(result.error.toString())));
            }
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
