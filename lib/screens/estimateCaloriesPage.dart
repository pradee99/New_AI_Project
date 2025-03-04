import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EstimateCaloriesPage extends StatefulWidget {
  const EstimateCaloriesPage({super.key});

  @override
  State<EstimateCaloriesPage> createState() => _EstimateCaloriesPageState();
}

class _EstimateCaloriesPageState extends State<EstimateCaloriesPage> {
  final List<FoodItem> _foodItems = [
    FoodItem(name: 'Uludu wade', caloriesPerItem: 250),
    FoodItem(name: 'Parippu wade', caloriesPerItem: 400),
    FoodItem(name: 'Elawalu roti', caloriesPerItem: 300),
    FoodItem(name: 'Egg roll', caloriesPerItem: 200),
    FoodItem(name: 'Fish roll', caloriesPerItem: 350),
    FoodItem(name: 'Samosa', caloriesPerItem: 200),
    FoodItem(name: 'Pan cake', caloriesPerItem: 200),
    FoodItem(name: 'Donut', caloriesPerItem: 200),
    FoodItem(name: 'Peni walalu', caloriesPerItem: 200),
    FoodItem(name: 'Cake', caloriesPerItem: 200),
    FoodItem(name: 'Roti', caloriesPerItem: 200),
    FoodItem(name: 'Parata', caloriesPerItem: 200),
    FoodItem(name: 'Those', caloriesPerItem: 200),
    FoodItem(name: 'Idiapp', caloriesPerItem: 200),
    FoodItem(name: 'Peni appa', caloriesPerItem: 200),
    FoodItem(name: 'Kiribath', caloriesPerItem: 200),
  ];

  final Map<String, int> _quantities = {};
  final List<String> _history = [];

  int _calculateTotalCalories() {
    int totalCalories = 0;
    for (var foodItem in _foodItems) {
      totalCalories += (_quantities[foodItem.name] ?? 0) * foodItem.caloriesPerItem;
    }
    return totalCalories;
  }

  void _updateQuantity(String foodItemName, int quantity) {
    setState(() {
      _quantities[foodItemName] = quantity;
    });
  }

  void _addToHistory(int totalCalories) {
    final timestamp = DateTime.now();
    _history.add('Calories: $totalCalories - Date: $timestamp');
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Select food items and estimate your total calorie intake:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _foodItems.length,
                itemBuilder: (context, index) {
                  final foodItem = _foodItems[index];
                  return Card(
                    color: Colors.white,  // Set the background to white
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      title: Text(foodItem.name,
                          style: const TextStyle(fontSize: 20)),
                      trailing: QuantitySelector(
                        currentQuantity: _quantities[foodItem.name] ?? 0,
                        onQuantityChanged: (quantity) =>
                            _updateQuantity(foodItem.name, quantity),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final totalCalories = _calculateTotalCalories();
                  _addToHistory(totalCalories);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.teal.shade50, // Set the popup background color to teal.shade50
                        title: Text(
                          'Total Calories',
                          style: TextStyle(color: Colors.teal.shade900), // Set the title text color to teal.shade900
                        ),
                        content: Text(
                          'You have consumed a total of $totalCalories calories.',
                          style: TextStyle(fontSize: 18, color: Colors.teal.shade900), // Set the content text color to teal.shade900
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text(
                              'OK',
                              style: TextStyle(color: Colors.teal.shade900), // Set the button text color to teal.shade900
                            ),
                          ),
                        ],
                      );
                    },
                  );

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Calculate Total Calories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
            ),
          ],
        ),
      );
  }
}

class FoodItem {
  final String name;
  final int caloriesPerItem;

  FoodItem({required this.name, required this.caloriesPerItem});
}

class QuantitySelector extends StatelessWidget {
  final int currentQuantity;
  final ValueChanged<int> onQuantityChanged;

  const QuantitySelector(
      {super.key,
        required this.currentQuantity,
        required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline, color: Colors.teal),
            onPressed: () {
              if (currentQuantity > 0) {
                onQuantityChanged(currentQuantity - 1);
              }
            },
          ),
          Text(
            '$currentQuantity',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Colors.teal),
            onPressed: () {
              onQuantityChanged(currentQuantity + 1);
            },
          ),
        ],
      ),
    );
  }
}
