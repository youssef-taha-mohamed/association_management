import 'package:flutter/material.dart';
import 'donation_types.dart';

class EditDonationTypePage extends StatefulWidget {
  final DonationType donationType;
  final List<String> categories;

  const EditDonationTypePage({
    super.key,
    required this.donationType,
    required this.categories,
  });

  @override
  _EditDonationTypePageState createState() => _EditDonationTypePageState();
}

class _EditDonationTypePageState extends State<EditDonationTypePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController unitController;
  late TextEditingController valueController;
  late TextEditingController itemsController;

  late IconData selectedIcon;
  late Color selectedColor;
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    final donation = widget.donationType;
    nameController = TextEditingController(text: donation.name);
    descriptionController = TextEditingController(text: donation.description);
    unitController = TextEditingController(text: donation.unit);
    valueController = TextEditingController(text: donation.estimatedValue.toString());
    itemsController = TextEditingController(text: donation.items.join(', '));
    selectedIcon = donation.icon;
    selectedColor = donation.color;
    selectedCategory = donation.category;
  }

  final List<IconData> availableIcons = [
    Icons.local_grocery_store, Icons.attach_money, Icons.checkroom,
    Icons.medical_services, Icons.school, Icons.devices, Icons.home,
    Icons.local_hospital, Icons.restaurant, Icons.directions_car,
    Icons.build, Icons.pets,
  ];

  final List<Color> availableColors = [
    Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.red,
    Colors.teal, Colors.pink, Colors.indigo, Colors.amber, Colors.cyan,
    Colors.lime, Colors.brown,
  ];

  void _updateDonationType() {
    if (_formKey.currentState!.validate()) {
      final updatedDonationType = DonationType(
        id: widget.donationType.id,
        name: nameController.text,
        category: selectedCategory,
        description: descriptionController.text,
        unit: unitController.text,
        estimatedValue: double.tryParse(valueController.text) ?? 0.0,
        icon: selectedIcon,
        color: selectedColor,
        isActive: widget.donationType.isActive,
        donationsCount: widget.donationType.donationsCount,
        lastDonation: widget.donationType.lastDonation,
        items: itemsController.text.split(',').map((e) => e.trim()).toList(),
      );
      Navigator.pop(context, updatedDonationType);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Donation Type'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _updateDonationType,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: widget.categories.map((category) => DropdownMenuItem(
                  value: category,
                  child: Text(category),
                )).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: unitController,
                      decoration: const InputDecoration(
                        labelText: 'Unit (e.g., Package)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: valueController,
                      decoration: const InputDecoration(
                        labelText: 'Estimated Value (\$)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: itemsController,
                decoration: const InputDecoration(
                  labelText: 'Items (comma separated)',
                  border: OutlineInputBorder(),
                  hintText: 'e.g., Rice, Oil, Sugar',
                ),
              ),
              const SizedBox(height: 24),
              const Text('Select Icon:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              const SizedBox(height: 8),
              _buildIconSelector(),
              const SizedBox(height: 24),
              const Text('Select Color:', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              const SizedBox(height: 8),
              _buildColorSelector(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconSelector() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: availableIcons.length,
      itemBuilder: (context, index) {
        final icon = availableIcons[index];
        final isSelected = icon == selectedIcon;
        return GestureDetector(
          onTap: () => setState(() => selectedIcon = icon),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? selectedColor.withAlpha(40) : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: isSelected ? Border.all(color: selectedColor, width: 2) : null,
            ),
            child: Icon(icon, color: isSelected ? selectedColor : Colors.grey.shade600, size: 24),
          ),
        );
      },
    );
  }

  Widget _buildColorSelector() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: availableColors.length,
      itemBuilder: (context, index) {
        final color = availableColors[index];
        final isSelected = color == selectedColor;
        return GestureDetector(
          onTap: () => setState(() => selectedColor = color),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: isSelected ? Border.all(color: Colors.black, width: 3) : null,
            ),
            child: isSelected ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
          ),
        );
      },
    );
  }
}