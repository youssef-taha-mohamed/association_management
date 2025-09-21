import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import 'package:management/shared/widgets/main_textfield.dart';
import '../../../../../core/style/app_colors.dart';
import 'workplaces.dart'; // Import the Workplace model

class AddWorkplaceForm extends StatefulWidget {
  const AddWorkplaceForm({super.key});

  @override
  State<AddWorkplaceForm> createState() => _AddWorkplaceFormState();
}

class _AddWorkplaceFormState extends State<AddWorkplaceForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _establishedYearController = TextEditingController();
  final _employeeCountController = TextEditingController(); // Added controller

  String selectedType = 'NGO';
  bool isActive = true;

  List<String> workplaceTypes = [
    'NGO',
    'Association',
    'Charity',
    'Organization',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: MainText(context.l10n.add_workplace),
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
              // Basic Information Card
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

                      label: context.l10n.workplace_name,

                      prefixIcon: const Icon(Icons.business),

                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return context.l10n.please_enter_workplace_name;
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
                                workplaceTypes
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
                          child: MainTextField(
                            controller: _establishedYearController,

                            label: context.l10n.established_year,

                            prefixIcon: const Icon(Icons.calendar_today),

                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return context.l10n.please_enter_year;
                              }
                              if (int.tryParse(value!) == null) {
                                return context.l10n.invalid_year;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    MainTextField(
                      controller: _locationController,

                      label: context.l10n.location_address,

                      prefixIcon: const Icon(Icons.location_on),

                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return context.l10n.please_enter_location;
                        }
                        return null;
                      },
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
                    const SizedBox(height: 16),
                    MainTextField(
                      controller: _employeeCountController,

                      label: context.l10n.number_of_employees,

                      prefixIcon: const Icon(Icons.people_outline),

                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.l10n.please_enter_number_of_employees;
                        }
                        if (int.tryParse(value) == null) {
                          return context.l10n.please_enter_a_valid_number;
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
                        Text(
                          isActive
                              ? context.l10n.active
                              : context.l10n.inactive,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Contact Information Card
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
                      context.l10n.contact_information,

                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 16),
                    MainTextField(
                      controller: _contactPersonController,

                      label: context.l10n.contact_person,

                      prefixIcon: const Icon(Icons.person),

                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return context.l10n.please_enter_contact_person;
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
                          return context.l10n.please_enter_a_valid_email;
                        }
                        return null;
                      },
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
                      onPressed: _saveWorkplace,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: MainText(context.l10n.save_workpiace),
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

  void _saveWorkplace() {
    if (_formKey.currentState?.validate() ?? false) {
      final newWorkplace = Workplace(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        type: selectedType,
        location: _locationController.text,
        description: _descriptionController.text,
        employeeCount: int.parse(_employeeCountController.text),
        isActive: isActive,
        establishedYear: int.parse(_establishedYearController.text),
        contactPerson: _contactPersonController.text,
        phone: _phoneController.text,
        email: _emailController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MainText(context.l10n.workplace_saved_successfully),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context, newWorkplace);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _contactPersonController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _establishedYearController.dispose();
    _employeeCountController.dispose();
    super.dispose();
  }
}
