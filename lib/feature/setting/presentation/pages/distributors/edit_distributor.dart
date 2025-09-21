import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import 'package:management/shared/widgets/main_textfield.dart';

import '../../../../../core/style/app_colors.dart';
import '../../../domain/entities/distributors.dart';

class EditDistributorForm extends StatefulWidget {
  final Distributor distributor;

  const EditDistributorForm({super.key, required this.distributor});

  @override
  State<EditDistributorForm> createState() => _EditDistributorFormState();
}

class _EditDistributorFormState extends State<EditDistributorForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _emergencyContactController;
  late final TextEditingController _experienceController;

  late String selectedRegion;
  late String selectedVehicleType;
  late String selectedStatus;
  late List<String> selectedLanguages;
  late List<String> selectedSpecializations;

  List<String> regions = [
    'Greater Cairo',
    'Alexandria Coastal',
    'Upper Egypt Rural',
    'Delta Region',
    'Red Sea Coast',
  ];
  List<String> vehicleTypes = [
    'Car',
    'Motorcycle',
    'Van',
    'Bicycle',
    'Walking',
  ];
  List<String> statuses = ['Active', 'On Leave', 'Inactive'];
  List<String> availableLanguages = [
    'Arabic',
    'English',
    'French',
    'German',
    'Spanish',
  ];
  List<String> availableSpecializations = [
    'Food Packages',
    'Cash Assistance',
    'Medical Supplies',
    'Clothes',
    'School Supplies',
    'Emergency Aid',
  ];

  @override
  void initState() {
    super.initState();
    final d = widget.distributor;
    _nameController = TextEditingController(text: d.name);
    _emailController = TextEditingController(text: d.email);
    _phoneController = TextEditingController(text: d.phone);
    _addressController = TextEditingController(text: d.address);
    _emergencyContactController = TextEditingController(
      text: d.emergencyContact,
    );
    _experienceController = TextEditingController(text: d.experience);

    selectedRegion = d.region;
    selectedVehicleType = d.vehicleType;
    selectedStatus = d.status;
    selectedLanguages = List.from(d.languages);
    selectedSpecializations = List.from(d.specialization);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: MainText(context.l10n.edit_distributor),
        backgroundColor: AppColors.primaryColor,
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
              _buildPersonalInfoSection(),
              const SizedBox(height: 16),
              _buildContactInfoSection(),
              const SizedBox(height: 16),
              _buildWorkInfoSection(),
              const SizedBox(height: 16),
              _buildSkillsSection(),
              const SizedBox(height: 24),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
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
            onPressed: _saveChanges,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple.shade600,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: MainText(context.l10n.save_changes),
          ),
        ),
      ],
    );
  }

  void _saveChanges() {
    if (_formKey.currentState?.validate() ?? false) {
      if (selectedLanguages.isEmpty || selectedSpecializations.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: MainText(
              context
                  .l10n
                  .please_select_at_least_one_language_and_specialization,
            ),
            backgroundColor: AppColors.red,
          ),
        );
        return;
      }

      final distributor = widget.distributor;
      distributor.name = _nameController.text;
      distributor.email = _emailController.text;
      distributor.phone = _phoneController.text;
      distributor.address = _addressController.text;
      distributor.emergencyContact = _emergencyContactController.text;
      distributor.experience = _experienceController.text;
      distributor.region = selectedRegion;
      distributor.vehicleType = selectedVehicleType;
      distributor.status = selectedStatus;
      distributor.languages = selectedLanguages;
      distributor.specialization = selectedSpecializations;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MainText(
            '${context.l10n.changes_for}"${distributor.name}" ${context.l10n.saved_successfully}',
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context, distributor);
    }
  }

  // All other _build... methods are identical to add_distributor_form.dart
  // Copy them here.
  Widget _buildPersonalInfoSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(
            context.l10n.personal_information,

            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),

          const SizedBox(height: 16),
          MainTextField(
            controller: _nameController,

            label: context.l10n.full_name,

            prefixIcon: const Icon(Icons.person),

            validator: (value) {
              if (value?.isEmpty ?? true) {
                return context.l10n.please_enter_full_name;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          MainTextField(
            controller: _addressController,

            label: context.l10n.address,

            prefixIcon: const Icon(Icons.home),

            validator: (value) {
              if (value?.isEmpty ?? true) {
                return context.l10n.address_required;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedRegion,
                  decoration: InputDecoration(
                    labelText: 'Region',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.location_on),
                  ),
                  items:
                      regions
                          .map(
                            (region) => DropdownMenuItem(
                              value: region,
                              child: Text(region),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRegion = value!;
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedStatus,
                  decoration: InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.flag),
                  ),
                  items:
                      statuses
                          .map(
                            (status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoSection() {
    return Container(
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
            context.l10n.contact_information,

            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
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
            controller: _phoneController,

            label: context.l10n.phone_number,

            prefixIcon: const Icon(Icons.phone),

            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return context.l10n.phone_number_required;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          MainTextField(
            controller: _emergencyContactController,

            label: context.l10n.emergency_contact,

            prefixIcon: const Icon(Icons.emergency),

            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return context.l10n.please_enter_emergency_contact;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWorkInfoSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(
            context.l10n.work_information,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: MainTextField(
                  controller: _experienceController,
                  label: context.l10n.experience,
                  prefixIcon: const Icon(Icons.work),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return context.l10n.please_enter_experience;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedVehicleType,
                  decoration: InputDecoration(
                    labelText: 'Vehicle Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    prefixIcon: const Icon(Icons.directions_car),
                  ),
                  items:
                      vehicleTypes
                          .map(
                            (vehicle) => DropdownMenuItem(
                              value: vehicle,
                              child: Text(vehicle),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedVehicleType = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Container(
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
            context.l10n.skills_languages,

            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),

          const SizedBox(height: 16),
          MainText(
            context.l10n.languages,

            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                availableLanguages.map((lang) {
                  final isSelected = selectedLanguages.contains(lang);
                  return FilterChip(
                    label: MainText(lang),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedLanguages.add(lang);
                        } else {
                          selectedLanguages.remove(lang);
                        }
                      });
                    },
                    backgroundColor: Colors.grey.shade100,
                    selectedColor: Colors.green.shade100,
                    checkmarkColor: Colors.green.shade600,
                  );
                }).toList(),
          ),
          const SizedBox(height: 16),
          MainText(
            context.l10n.specializations,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                availableSpecializations.map((spec) {
                  final isSelected = selectedSpecializations.contains(spec);
                  return FilterChip(
                    label: MainText(spec),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedSpecializations.add(spec);
                        } else {
                          selectedSpecializations.remove(spec);
                        }
                      });
                    },
                    backgroundColor: Colors.grey.shade100,
                    selectedColor: Colors.blue.shade100,
                    checkmarkColor: Colors.blue.shade600,
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emergencyContactController.dispose();
    _experienceController.dispose();
    super.dispose();
  }
}
