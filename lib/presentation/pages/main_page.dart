import "package:flutter/material.dart";

import "../../domain/entities/user.dart";

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main page")),
      body: Center(child: Text(user.toString())),
    );
  }
}
