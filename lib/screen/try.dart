import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController _itemNameController = TextEditingController(text: 'Mozalichiken Halim');
  final TextEditingController _detailsController = TextEditingController(
    text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Bibendum in vel, mattis et amet dui mauris turpis.',
  );

  bool _isPickupSelected = true;
  bool _isDeliverySelected = false;

  // Ingredients selection state
  final Map<String, bool> _basicIngredients = {
    'Salt': false,
    'Chicken': true,
    'Onion': false,
    'Garlic': false,
    'Poppers': false,
    'Ginger': false,
  };

  final Map<String, bool> _fruitIngredients = {
    'Avocado': false,
    'Apple': false,
    'Blueberry': false,
    'Broccoli': false,
    'Orange': false,
    'Walnut': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Items'),
        actions: [
          TextButton(
            onPressed: () {
              // Reset functionality
              _itemNameController.clear();
              _detailsController.clear();
              setState(() {
                _basicIngredients.updateAll((key, value) => false);
                _fruitIngredients.updateAll((key, value) => false);
                _isPickupSelected = true;
                _isDeliverySelected = false;
              });
            },
            child: const Text(
              'RESET',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ITEM NAME
            const Text(
              'ITEM NAME',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _itemNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              ),
            ),
            const SizedBox(height: 24),

            // UPLOAD PHOTO/VIDEO
            const Text(
              'UPLOAD PHOTO/VIDEO',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 40,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // PRICE SECTION
            const Text(
              'PRICE',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: '50',
                    decoration: InputDecoration(
                      prefixText: '\$',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Row(
                    children: [
                      // Pick up button
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPickupSelected = true;
                              _isDeliverySelected = false;
                            });
                          },
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: _isPickupSelected ? Colors.blue : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _isPickupSelected ? Colors.blue : Colors.grey.shade300,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Pick up',
                                style: TextStyle(
                                  color: _isPickupSelected ? Colors.white : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Delivery button
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPickupSelected = false;
                              _isDeliverySelected = true;
                            });
                          },
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: _isDeliverySelected ? Colors.blue : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _isDeliverySelected ? Colors.blue : Colors.grey.shade300,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Delivery',
                                style: TextStyle(
                                  color: _isDeliverySelected ? Colors.white : Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // INGREDIENTS SECTION
            const Text(
              'INGRIDENTS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),

            // Basic Ingredients
            _buildIngredientsSection('Basic', _basicIngredients),
            const SizedBox(height: 16),

            // Fruit Ingredients
            _buildIngredientsSection('Fruit', _fruitIngredients),
            const SizedBox(height: 24),

            // DETAILS SECTION
            const Text(
              'DETAILS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _detailsController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 32),

            // SAVE CHANGES BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Save changes functionality
                  _saveItem();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'SAVE CHANGES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientsSection(String title, Map<String, bool> ingredients) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                // Show all ingredients functionality
                _showAllIngredients(title, ingredients);
              },
              child: const Row(
                children: [
                  Text('See All'),
                  Icon(Icons.arrow_drop_down, size: 20),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ingredients.entries.map((entry) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  ingredients[entry.key] = !entry.value;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: entry.value ? Colors.blue : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: entry.value ? Colors.blue : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  entry.key,
                  style: TextStyle(
                    color: entry.value ? Colors.white : Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _showAllIngredients(String category, Map<String, bool> ingredients) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$category Ingredients',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ingredients.entries.map((entry) {
                  return ChoiceChip(
                    label: Text(entry.key),
                    selected: entry.value,
                    onSelected: (selected) {
                      setState(() {
                        ingredients[entry.key] = selected;
                      });
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveItem() {
    // Implement save functionality here
    final itemName = _itemNameController.text;
    final price = 50; // You would get this from the price field
    final details = _detailsController.text;

    // Get selected ingredients
    final selectedBasicIngredients = _basicIngredients.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    final selectedFruitIngredients = _fruitIngredients.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    print('Item saved: $itemName');
    print('Price: \$$price');
    print('Pickup: $_isPickupSelected, Delivery: $_isDeliverySelected');
    print('Basic Ingredients: $selectedBasicIngredients');
    print('Fruit Ingredients: $selectedFruitIngredients');
    print('Details: $details');

    // Show success message or navigate back
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _detailsController.dispose();
    super.dispose();
  }
}