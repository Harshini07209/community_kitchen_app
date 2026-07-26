import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'screens/dashboard/dashboard_screen.dart';

void main() {
  runApp(const CommunityKitchenApp());
}

class CommunityKitchenApp extends StatelessWidget {
  const CommunityKitchenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Community Kitchen",
      theme: AppTheme.lightTheme,
      home: const DashboardScreen(),
    );
  }
}