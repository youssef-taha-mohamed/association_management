import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import 'package:management/shared/widgets/main_textfield.dart';
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
    Icons.family_restroom,
    Icons.elderly,
    Icons.child_care,
    Icons.accessible,
    Icons.woman,
    Icons.flight_takeoff,
    Icons.work,
    Icons.school,
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
  ];
  final List<String> priorities = ['Low', 'Medium', 'High', 'Critical'];

  void _addCategory() {
    if (_formKey.currentState!.validate()) {
      final newCategory = BeneficiaryCategory(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text,
        description:
            descriptionController.text.isEmpty
                ? 'No description'
                : descriptionController.text,
        beneficiaryCount: 0,
        icon: selectedIcon,
        color: selectedColor,
        priority: selectedPriority,
        isActive: true,
        criteria:
            criteriaController.text.isEmpty
                ? []
                : criteriaController.text
                    .split(',')
                    .map((e) => e.trim())
                    .toList(),
        lastUpdated: DateTime.now(),
      );
      Navigator.pop(context, newCategory);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MainText(context.l10n.add_new_category),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _addCategory),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainTextField(
                controller: nameController,

                label: context.l10n.category_name,

                validator:
                    (v) => v!.isEmpty ? context.l10n.name_required : null,
              ),
              const SizedBox(height: 16),
              MainTextField(
                controller: descriptionController,

                label: context.l10n.description,

                maxLines: 2,
              ),
              const SizedBox(height: 16),
              MainTextField(
                controller: criteriaController,

                label: context.l10n.criteria_comma_separated,

                hint: context.l10n.low_income_has_children,

                maxLines: 2,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedPriority,
                decoration: const InputDecoration(
                  labelText: 'Priority',
                  border: OutlineInputBorder(),
                ),
                items:
                    priorities
                        .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                        .toList(),
                onChanged: (v) => setState(() => selectedPriority = v!),
              ),
              const SizedBox(height: 24),
              MainText(
                context.l10n.select_icon,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 8),
              // Icon Selector Grid
              _buildIconSelector(),
              const SizedBox(height: 24),
              MainText(
                context.l10n.select_color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
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
  Widget _buildIconSelector() {
    /* ... implementation ... */
    return Container();
  }

  Widget _buildColorSelector() {
    /* ... implementation ... */
    return Container();
  }
}
