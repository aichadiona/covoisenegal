import 'package:covoisenegal/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,

      child: Stack(
        children: [
          Positioned(
            left: -120,

            top: -170,

            child: Transform.rotate(
              angle: -.4,

              child: Container(
                width: 420,

                height: 320,

                decoration: BoxDecoration(
                  color: AppColors.primary,

                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          const Align(
            alignment: Alignment.bottomCenter,

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Text("🇸🇳", style: TextStyle(fontSize: 45)),

                SizedBox(height: 10),

                Text(
                  "COVOITSENEGAL",

                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 8),

                SizedBox(
                  width: 140,

                  child: Divider(thickness: 5, color: AppColors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
