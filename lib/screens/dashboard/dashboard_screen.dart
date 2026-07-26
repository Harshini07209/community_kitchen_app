import 'package:flutter/material.dart';

import '../../widgets/dashboard_card.dart';
import '../../widgets/quick_action_button.dart';

import '../add_record/add_record_screen.dart';
import '../inventory/inventory_screen.dart';
import '../records/records_screen.dart';
import '../reports/reports_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fa),

      appBar: AppBar(
        title: const Text("Community Kitchen"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "👋 Welcome!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Manage your community kitchen efficiently",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 25),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.6,

              children: const [

                DashboardCard(
                  title: "Meals",
                  value: "245",
                  icon: Icons.restaurant,
                  color: Colors.green,
                ),

                DashboardCard(
                  title: "People",
                  value: "118",
                  icon: Icons.people,
                  color: Colors.orange,
                ),

                DashboardCard(
                  title: "Inventory",
                  value: "82%",
                  icon: Icons.inventory,
                  color: Colors.blue,
                ),

                DashboardCard(
                  title: "Online",
                  value: "Yes",
                  icon: Icons.cloud_done,
                  color: Colors.teal,
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Quick Actions",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.3,

              children: [

                QuickActionButton(
                  title: "Add Meal",
                  icon: Icons.add_circle_outline,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddRecordScreen(),
                      ),
                    );
                  },
                ),

                QuickActionButton(
                  title: "Inventory",
                  icon: Icons.inventory_2_outlined,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const InventoryScreen(),
                      ),
                    );
                  },
                ),

                QuickActionButton(
                  title: "Records",
                  icon: Icons.list_alt,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RecordsScreen(),
                      ),
                    );
                  },
                ),

                QuickActionButton(
                  title: "Reports",
                  icon: Icons.bar_chart,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ReportsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}