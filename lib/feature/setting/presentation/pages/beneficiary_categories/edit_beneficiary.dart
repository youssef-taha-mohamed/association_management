import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../../shared/widgets/main_text.dart';
import 'beneficiary_categories.dart'; // Import your model

class EditBeneficiaryCategoryPage extends StatefulWidget {
  final BeneficiaryCategory category;
  const EditBeneficiaryCategoryPage({super.key, required this.category});

  @override
  _EditBeneficiaryCategoryPageState createState() =>
      _EditBeneficiaryCategoryPageState();
}

class _EditBeneficiaryCategoryPageState
    extends State<EditBeneficiaryCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController criteriaController;

  late IconData selectedIcon;
  late Color selectedColor;
  late String selectedPriority;

  @override
  void initState() {
    super.initState();
    final cat = widget.category;
    nameController = TextEditingController(text: cat.name);
    descriptionController = TextEditingController(text: cat.description);
    criteriaController = TextEditingController(text: cat.criteria.join(', '));
    selectedIcon = cat.icon;
    selectedColor = cat.color;
    selectedPriority = cat.priority;
  }

  // Same lists as in the Add Page
  final List<IconData> availableIcons = [/* ... */];
  final List<Color> availableColors = [/* ... */];
  final List<String> priorities = ['Low', 'Medium', 'High', 'Critical'];

  void _updateCategory() {
    if (_formKey.currentState!.validate()) {
      final updatedCategory = BeneficiaryCategory(
        id: widget.category.id, // Keep the same ID
        name: nameController.text,
        description: descriptionController.text,
        beneficiaryCount:
            widget.category.beneficiaryCount, // Keep original count
        icon: selectedIcon,
        color: selectedColor,
        priority: selectedPriority,
        isActive: widget.category.isActive, // Keep original status
        criteria:
            criteriaController.text.split(',').map((e) => e.trim()).toList(),
        lastUpdated: DateTime.now(), // Update timestamp
      );
      Navigator.pop(context, updatedCategory);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MainText(context.l10n.edit_category),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _updateCategory),
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
                items:
                    priorities
                        .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                        .toList(),
                onChanged: (v) => setState(() => selectedPriority = v!),
              ),
              const SizedBox(height: 24),
              const Text(
                'Select Icon',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildIconSelector(),
              const SizedBox(height: 24),
              const Text(
                'Select Color',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildColorSelector(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widgets for icon and color selection (same as add page)
  Widget _buildIconSelector() {
    /* ... implementation ... */
    return Container();
  }

  Widget _buildColorSelector() {
    /* ... implementation ... */
    return Container();
  }
}
