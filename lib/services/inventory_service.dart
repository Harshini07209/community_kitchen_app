import '../models/inventory_item.dart';

class InventoryService {
  static final List<InventoryItem> items = [
    InventoryItem(name: "Rice", quantity: 120, unit: "kg"),
    InventoryItem(name: "Vegetables", quantity: 60, unit: "kg"),
    InventoryItem(name: "Oil", quantity: 30, unit: "L"),
    InventoryItem(name: "Milk", quantity: 18, unit: "L"),
    InventoryItem(name: "Dal", quantity: 80, unit: "kg"),
  ];

  List<InventoryItem> getItems() => items;

  void addStock(int index, int qty) {
    items[index].quantity += qty;
  }

  void useStock(int index, int qty) {
    items[index].quantity -= qty;
    if (items[index].quantity < 0) {
      items[index].quantity = 0;
    }
  }
}