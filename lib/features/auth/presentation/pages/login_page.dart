import 'package:flutter/material.dart';
import 'package:covoisenegal/features/auth/presentation/pages/widgets/login_header.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/utils/responsive.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// HEADER (logo + forme verte)
              const LoginHeader(),

              SizedBox(height: Responsive.hp(context, 2)),

              /// TEXTE BIENVENUE
              const Text(
                "Bienvenue ! Connectez-vous pour\ncontinuer l'aventure",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),

              SizedBox(height: Responsive.hp(context, 4)),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    /// USERNAME
                    AppTextField(
                      controller: usernameController,
                      hint: "Username ou téléphone",
                      icon: Icons.person_outline,
                    ),

                    SizedBox(height: Responsive.hp(context, 2)),

                    /// PASSWORD
                    AppTextField(
                      controller: passwordController,
                      hint: "Mot de passe",
                      icon: Icons.lock_outline,
                      obscureText: true,
                    ),

                    /// FORGOT PASSWORD
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                            color: Color(0xff2E7D32),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: Responsive.hp(context, 1)),

                    /// BUTTON LOGIN
                    AppButton(
                      text: "Se connecter",
                      onTap: () {
                        final data = {
                          "identifier": usernameController.text.trim(),
                          "password": passwordController.text.trim(),
                        };

                        print(data);
                      },
                    ),

                    SizedBox(height: Responsive.hp(context, 4)),

                    /// CREATE ACCOUNT
                    InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffF3F8F2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pas encore de compte ? ",
                              style: TextStyle(color: Colors.black54),
                            ),

                            Text(
                              "Créer un compte",
                              style: TextStyle(
                                color: Color(0xff2E7D32),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Color(0xff2E7D32),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Responsive.hp(context, 3)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
