import 'package:flutter/material.dart';
import '../../models/meal_record.dart';
import '../../services/meal_service.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  final MealService _mealService = MealService();
  List<MealRecord> meals = [];

  @override
  void initState() {
    super.initState();
    loadMeals();
  }

  Future<void> loadMeals() async {
    meals = await _mealService.getMeals();
    setState(() {});
  }

  Future<void> deleteMeal(int id) async {
    await _mealService.deleteMeal(id);
    loadMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Records"),
      ),
      body: meals.isEmpty
          ? const Center(
              child: Text("No Records Found"),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.restaurant),
                    ),
                    title: Text(
                        "${meal.mealType} - ${meal.mealsServed} Meals"),
                    subtitle: Text(
                        "${meal.volunteer}\n${meal.date}"),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        deleteMeal(meal.id!);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}