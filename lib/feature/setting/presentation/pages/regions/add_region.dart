import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../../core/style/app_colors.dart';
import 'regions.dart';

class AddRegionForm extends StatefulWidget {
  const AddRegionForm({super.key});

  @override
  State<AddRegionForm> createState() => _AddRegionFormState();
}

class _AddRegionFormState extends State<AddRegionForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _coordinatorController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _districtsController = TextEditingController();

  String selectedType = 'Urban';
  String selectedPriority = 'Medium';
  bool isActive = true;

  final List<String> regionTypes = [
    'Metropolitan',
    'Urban',
    'Rural',
    'Agricultural',
    'Remote',
  ];
  final List<String> priorities = ['Low', 'Medium', 'High', 'Critical'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: MainText(context.l10n.add_region),
        backgroundColor: AppColors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainText(
                      context.l10n.basic_information,

                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 16),
                    MainTextField(
                      controller: _nameController,

                      label: context.l10n.region_name,

                      prefixIcon: const Icon(Icons.location_on),

                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return context.l10n.please_enter_region_name;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: selectedType,
                            decoration: InputDecoration(
                              labelText: context.l10n.type,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(Icons.category),
                            ),
                            items:
                                regionTypes
                                    .map(
                                      (type) => DropdownMenuItem(
                                        value: type,
                                        child: MainText(type),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedType = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: selectedPriority,
                            decoration: InputDecoration(
                              labelText: context.l10n.priority,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: const Icon(Icons.priority_high),
                            ),
                            items:
                                priorities
                                    .map(
                                      (priority) => DropdownMenuItem(
                                        value: priority,
                                        child: MainText(priority),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedPriority = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    MainTextField(
                      controller: _descriptionController,

                      label: context.l10n.description,

                      prefixIcon: const Icon(Icons.description),

                      maxLines: 3,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return context.l10n.please_enter_description;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainText(
                      context.l10n.coordinator_information,

                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 16),
                    MainTextField(
                      controller: _coordinatorController,

                      label: context.l10n.coordinator_name,

                      prefixIcon: const Icon(Icons.person),

                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return context.l10n.please_enter_coordinator_name;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    MainTextField(
                      controller: _phoneController,

                      label: context.l10n.phone_number,

                      prefixIcon: const Icon(Icons.phone),

                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return context.l10n.please_enter_your_phone_number;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    MainTextField(
                      controller: _emailController,

                      label: context.l10n.email_address,

                      prefixIcon: const Icon(Icons.email),

                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return context.l10n.please_enter_email_address;
                        }
                        if (!value!.contains('@')) {
                          return context.l10n.please_enter_valid_email;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    MainTextField(
                      controller: _addressController,

                      label: context.l10n.office_address,

                      prefixIcon: const Icon(Icons.location_city),

                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return context.l10n.please_enter_office_address;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainText(
                      context.l10n.coverage_area,

                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 16),
                    MainTextField(
                      controller: _districtsController,

                      label: context.l10n.districts,

                      prefixIcon: const Icon(Icons.map),
                      hint: context.l10n.e_district,

                      maxLines: 2,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return context
                              .l10n
                              .please_enter_at_least_one_district;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        MainText(context.l10n.active_status),
                        Switch(
                          value: isActive,
                          onChanged: (value) {
                            setState(() {
                              isActive = value;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                        MainText(
                          isActive
                              ? context.l10n.active
                              : context.l10n.inactive,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.grey.shade400),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: MainText(context.l10n.cancel),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saveRegion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade600,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: MainText(context.l10n.save_region),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveRegion() {
    if (_formKey.currentState?.validate() ?? false) {
      final newRegion = Region(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        type: selectedType,
        description: _descriptionController.text,
        coordinator: _coordinatorController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        address: _addressController.text,
        isActive: isActive,
        priority: selectedPriority,
        districts:
            _districtsController.text.split(',').map((e) => e.trim()).toList(),
        lastActivity: DateTime.now(),
        // Default values for fields not in the form
        beneficiaryCount: 0,
        distributorCount: 0,
        activeProjects: 0,
        coverage: 0.0,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MainText(context.l10n.region_saved_successfully),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context, newRegion);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _coordinatorController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _districtsController.dispose();
    super.dispose();
  }
}
