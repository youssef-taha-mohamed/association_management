import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';
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
    valueController = TextEditingController(
      text: donation.estimatedValue.toString(),
    );
    itemsController = TextEditingController(text: donation.items.join(', '));
    selectedIcon = donation.icon;
    selectedColor = donation.color;
    selectedCategory = donation.category;
  }

  final List<IconData> availableIcons = [
    Icons.local_grocery_store,
    Icons.attach_money,
    Icons.checkroom,
    Icons.medical_services,
    Icons.school,
    Icons.devices,
    Icons.home,
    Icons.local_hospital,
    Icons.restaurant,
    Icons.directions_car,
    Icons.build,
    Icons.pets,
  ];

  final List<Color> availableColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.amber,
    Colors.cyan,
    Colors.lime,
    Colors.brown,
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
        title: MainText(context.l10n.edit_donation_type),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _updateDonationType,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainTextField(
                controller: nameController,

                label: context.l10n.name,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.l10n.please_enter_a_name;
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
                items:
                    widget.categories
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              MainTextField(
                controller: descriptionController,

                label: context.l10n.description,

                maxLines: 2,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: MainTextField(
                      controller: unitController,

                      label: context.l10n.unit,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: MainTextField(
                      controller: valueController,

                      label: context.l10n.estimated_value,

                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextField(
                controller: itemsController,

                label: context.l10n.items,

                hint: context.l10n.e_g_Rice_Oil_Sugar,
              ),
              const SizedBox(height: 24),
              MainText(
                context.l10n.select_icon,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),

              const SizedBox(height: 8),
              _buildIconSelector(),
              const SizedBox(height: 24),
              MainText(
                context.l10n.select_color,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),

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
              color:
                  isSelected
                      ? selectedColor.withAlpha(40)
                      : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border:
                  isSelected
                      ? Border.all(color: selectedColor, width: 2)
                      : null,
            ),
            child: Icon(
              icon,
              color: isSelected ? selectedColor : Colors.grey.shade600,
              size: 24,
            ),
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
              border:
                  isSelected
                      ? Border.all(color: AppColors.black, width: 3)
                      : null,
            ),
            child:
                isSelected
                    ? const Icon(Icons.check, color: AppColors.white, size: 16)
                    : null,
          ),
        );
      },
    );
  }
}
