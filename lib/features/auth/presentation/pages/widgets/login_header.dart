import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        children: [
          /// BACKGROUND GREEN SHAPE (plus large + diagonale propre)
          ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              height: 200,
              decoration: const BoxDecoration(color: Color(0xff2E7D32)),
            ),
          ),

          /// CENTER CONTENT
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// FLAG
                Image.asset("assets/images/drapeauSenegal.png", width: 60),

                const SizedBox(height: 25),

                /// TITLE
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "COVOIT",
                        style: TextStyle(
                          color: Color.fromARGB(255, 243, 252, 244),
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                        text: "SENEGAL",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                /// GREEN LINE
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xff2E7D32),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
