import '../models/meal_record.dart';

class MealService {
  static final List<MealRecord> _meals = [];

  Future<int> insertMeal(MealRecord meal) async {
    meal.id = DateTime.now().millisecondsSinceEpoch;
    _meals.insert(0, meal);
    return meal.id!;
  }

  Future<List<MealRecord>> getMeals() async {
    return List.from(_meals);
  }

  Future<int> deleteMeal(int id) async {
    _meals.removeWhere((meal) => meal.id == id);
    return 1;
  }

  Future<int> updateMeal(MealRecord meal) async {
    int index = _meals.indexWhere((e) => e.id == meal.id);

    if (index != -1) {
      _meals[index] = meal;
    }

    return 1;
  }
}