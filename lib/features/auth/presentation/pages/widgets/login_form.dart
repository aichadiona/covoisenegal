import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController identifierController;

  final TextEditingController passwordController;

  const LoginForm({
    super.key,

    required this.identifierController,

    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: identifierController,

          decoration: const InputDecoration(
            labelText: "Username ou téléphone",

            prefixIcon: Icon(Icons.person),
          ),
        ),

        const SizedBox(height: 20),

        TextField(
          controller: passwordController,

          obscureText: true,

          decoration: const InputDecoration(
            labelText: "Mot de passe",

            prefixIcon: Icon(Icons.lock),
          ),
        ),
      ],
    );
  }
}
