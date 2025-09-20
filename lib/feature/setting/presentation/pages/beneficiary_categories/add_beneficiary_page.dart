import 'package:flutter/material.dart';
import 'beneficiary_categories.dart'; // Import your model

class AddBeneficiaryCategoryPage extends StatefulWidget {
  const AddBeneficiaryCategoryPage({super.key});

  @override
  _AddBeneficiaryCategoryPageState createState() =>
      _AddBeneficiaryCategoryPageState();
}

class _AddBeneficiaryCategoryPageState
    extends State<AddBeneficiaryCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final criteriaController = TextEditingController();

  IconData selectedIcon = Icons.category;
  Color selectedColor = Colors.blue;
  String selectedPriority = 'Medium';

  final List<IconData> availableIcons = [
    Icons.family_restroom, Icons.elderly, Icons.child_care, Icons.accessible,
    Icons.woman, Icons.flight_takeoff, Icons.work, Icons.school,
  ];
  final List<Color> availableColors = [
    Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.red,
    Colors.teal, Colors.pink, Colors.indigo,
  ];
  final List<String> priorities = ['Low', 'Medium', 'High', 'Critical'];

  void _addCategory() {
    if (_formKey.currentState!.validate()) {
      final newCategory = BeneficiaryCategory(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text,
        description: descriptionController.text.isEmpty
            ? 'No description'
            : descriptionController.text,
        beneficiaryCount: 0,
        icon: selectedIcon,
        color: selectedColor,
        priority: selectedPriority,
        isActive: true,
        criteria: criteriaController.text.isEmpty
            ? []
            : criteriaController.text.split(',').map((e) => e.trim()).toList(),
        lastUpdated: DateTime.now(),
      );
      Navigator.pop(context, newCategory);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Category'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _addCategory,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Category Name',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => v!.isEmpty ? 'Name is required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: criteriaController,
                decoration: const InputDecoration(
                  labelText: 'Criteria (comma separated)',
                  border: OutlineInputBorder(),
                  hintText: 'e.g., Low income, Has children',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedPriority,
                decoration: const InputDecoration(
                  labelText: 'Priority',
                  border: OutlineInputBorder(),
                ),
                items: priorities
                    .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                    .toList(),
                onChanged: (v) => setState(() => selectedPriority = v!),
              ),
              const SizedBox(height: 24),
              const Text('Select Icon',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              // Icon Selector Grid
              _buildIconSelector(),
              const SizedBox(height: 24),
              const Text('Select Color',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              // Color Selector Grid
              _buildColorSelector(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widgets for icon and color selection (can be extracted)
  Widget _buildIconSelector() { /* ... implementation ... */ return Container();}
  Widget _buildColorSelector() { /* ... implementation ... */ return Container();}
}