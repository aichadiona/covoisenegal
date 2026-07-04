import 'package:flutter/material.dart';
import 'package:covoisenegal/features/auth/presentation/pages/login_page.dart';

// Trips module
import '../pages/trajets/search_trip_page.dart';
import '../pages/trajets//trip_list_page.dart';
import '../pages/trajets/trip_detail_page.dart';
import '../pages/trajets/booking_page.dart';
import '../pages/trajets/trips_history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7F5),

      appBar: AppBar(
        title: const Text("Accueil"),
        backgroundColor: const Color(0xff2E7D32),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            color: const Color.fromARGB(255, 194, 0, 0),
            icon: const Icon(Icons.logout),
            onPressed: () => _showLogoutDialog(context),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff2E7D32), Color(0xff4CAF50)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenue 👋",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Heureux de vous revoir sur votre application",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// CARTE PROFIL
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xff2E7D32),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Utilisateur",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Bienvenue dans votre espace",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// GRID MENU
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCard(context, Icons.directions_car, "Trajets"),
                  _buildCard(context, Icons.map, "Carte"),
                  _buildCard(context, Icons.chat, "Messages"),
                  _buildCard(context, Icons.person, "Profil"),
                  _buildCard(context, Icons.history, "Historique"),
                  _buildCard(context, Icons.settings, "Paramètres"),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// CARD DESIGN MODERNE
  Widget _buildCard(BuildContext context, IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xffF1F8F4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          _handleNavigation(context, title);
        },
        borderRadius: BorderRadius.circular(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0xffE8F5E9),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: const Color(0xff2E7D32)),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  /// LOGOUT
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),

          title: const Text(
            "Déconnexion",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          content: const Text("Voulez-vous vraiment vous déconnecter ?"),

          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Annuler",
                style: TextStyle(color: Color.fromARGB(255, 158, 158, 158)),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 238, 92, 81),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                "Se déconnecter",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

void _handleNavigation(BuildContext context, String title) {
  switch (title) {
    case "Trajets":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SearchTripPage()),
      );
      break;

    case "Historique":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const TripsHistoryPage()),
      );
      break;

    case "Carte":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const TripListPage()),
      );
      break;

    case "Messages":
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Module Messages bientôt disponible")),
      );
      break;

    case "Profil":
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profil bientôt disponible")),
      );
      break;

    case "Paramètres":
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Paramètres bientôt disponibles")),
      );
      break;
  }
}
