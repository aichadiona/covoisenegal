import 'package:covoisenegal/features/auth/presentation/pages/register_page.dart';
import 'package:covoisenegal/features/auth/presentation/pages/widgets/login_header.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/utils/responsive.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController identifierController = TextEditingController();

  @override
  void dispose() {
    identifierController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// 🔥 HEADER FIX (IMPORTANT)
              SizedBox(height: 220, child: const LoginHeader()),

              /// CONTENT
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: Responsive.hp(context, 3)),

                    /// ICON
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xffF3F8F2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.lock_reset,
                        size: 45,
                        color: Color(0xff2E7D32),
                      ),
                    ),

                    SizedBox(height: Responsive.hp(context, 3)),

                    /// TITLE
                    const Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// SUBTITLE
                    const Text(
                      "Entrez votre username ou numéro de téléphone\npour recevoir un lien de réinitialisation",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),

                    SizedBox(height: Responsive.hp(context, 5)),

                    /// INPUT
                    AppTextField(
                      controller: identifierController,
                      hint: "Username ou numéro de téléphone",
                      icon: Icons.person_outline,
                      keyboardType: TextInputType.text,
                    ),

                    SizedBox(height: Responsive.hp(context, 3)),

                    /// BUTTON
                    AppButton(
                      text: "Envoyer le lien",
                      onTap: () {
                        final value = identifierController.text.trim();

                        if (value.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Veuillez remplir le champ"),
                            ),
                          );
                          return;
                        }

                        // TODO backend
                        print("Reset password for: $value");

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Lien envoyé avec succès"),
                            backgroundColor: Color(0xff2E7D32),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: Responsive.hp(context, 4)),

                    /// BACK TO LOGIN
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Retour à la connexion",
                        style: TextStyle(
                          color: Color(0xff2E7D32),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    /// REGISTER LINK
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
