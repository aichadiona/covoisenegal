import 'package:covoisenegal/features/auth/presentation/pages/widgets/loginFooter.dart';
import 'package:covoisenegal/features/auth/presentation/pages/widgets/loginForm.dart';
import 'package:covoisenegal/features/auth/presentation/pages/widgets/loginHeader.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final identifierController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              const LoginHeader(),
              const SizedBox(height: 40),

              LoginForm(
                identifierController: identifierController,

                passwordController: passwordController,
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,

                height: 55,

                child: ElevatedButton(
                  onPressed: () {
                    print(identifierController.text);

                    print(passwordController.text);
                  },

                  child: const Text(
                    "Connexion",

                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
