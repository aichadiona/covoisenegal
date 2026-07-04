import 'package:flutter/material.dart';

class TripsHistoryPage extends StatefulWidget {
  const TripsHistoryPage({super.key});

  @override
  State<TripsHistoryPage> createState() => _TripsHistoryPageState();
}

class _TripsHistoryPageState extends State<TripsHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7F5),

      appBar: AppBar(
        title: const Text("Historique des trajets"),
        backgroundColor: const Color(0xff2E7D32),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "Passés"),
            Tab(text: "À venir"),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [_buildPastTrips(), _buildFutureTrips()],
      ),
    );
  }

  // 📌 TRAJETS PASSÉS
  Widget _buildPastTrips() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _tripCard(
          title: "Dakar → Mbour",
          date: "12 Juin 2026",
          status: "Terminé",
          color: Colors.grey,
          icon: Icons.check_circle,
        ),
        _tripCard(
          title: "Thiès → Dakar",
          date: "08 Juin 2026",
          status: "Terminé",
          color: Colors.grey,
          icon: Icons.check_circle,
        ),
      ],
    );
  }

  // 📌 TRAJETS FUTURS
  Widget _buildFutureTrips() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _tripCard(
          title: "Dakar → Thiès",
          date: "05 Juillet 2026",
          status: "En attente",
          color: Colors.orange,
          icon: Icons.schedule,
        ),
        _tripCard(
          title: "Dakar → Saint-Louis",
          date: "10 Juillet 2026",
          status: "Confirmé",
          color: Colors.green,
          icon: Icons.directions_car,
        ),
      ],
    );
  }

  // 🧩 CARD DESIGN
  Widget _tripCard({
    required String title,
    required String date,
    required String status,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(date, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
