class MealRecord {
  int? id;
  String mealType;
  int mealsServed;
  String volunteer;
  String notes;
  String date;

  MealRecord({
    this.id,
    required this.mealType,
    required this.mealsServed,
    required this.volunteer,
    required this.notes,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mealType': mealType,
      'mealsServed': mealsServed,
      'volunteer': volunteer,
      'notes': notes,
      'date': date,
    };
  }

  factory MealRecord.fromMap(Map<String, dynamic> map) {
    return MealRecord(
      id: map['id'],
      mealType: map['mealType'],
      mealsServed: map['mealsServed'],
      volunteer: map['volunteer'],
      notes: map['notes'],
      date: map['date'],
    );
  }
}