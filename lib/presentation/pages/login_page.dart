import "package:flix_id/presentation/pages/main_page.dart";
import "package:flutter/material.dart";

import "../../data/dummies/dummy_authentication.dart";
import "../../data/dummies/dummy_user_repository.dart";
import "../../domain/usecases/login.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final Login login = Login(
              authentication: DummyAuthentication(),
              userRepository: DummyUserRepository(),
            );

            final result = await login(
              LoginParams(email: "nfjanfja", password: "jfndjan"),
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
