import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';

import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart';
import '../../../domain/entities/distributors.dart';

class AddDistributorForm extends StatefulWidget {
  const AddDistributorForm({super.key});

  @override
  State<AddDistributorForm> createState() => _AddDistributorFormState();
}

class _AddDistributorFormState extends State<AddDistributorForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _emergencyContactController = TextEditingController();
  final _experienceController = TextEditingController();

  String selectedRegion = 'Greater Cairo';
  String selectedVehicleType = 'Car';
  String selectedStatus = 'Active';
  List<String> selectedLanguages = ['Arabic'];
  List<String> selectedSpecializations = [];

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: MainText(context.l10n.add_distributor),
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
          SizedBox(height: 16),
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
                              child: MainText(vehicle),
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
            onPressed: _saveDistributor,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple.shade600,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: MainText(context.l10n.save_distributor),
          ),
        ),
      ],
    );
  }

  void _saveDistributor() {
    if (_formKey.currentState?.validate() ?? false) {
      if (selectedLanguages.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: MainText(context.l10n.please_select_at_least_one_language),
            backgroundColor: AppColors.red,
          ),
        );
        return;
      }

      if (selectedSpecializations.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: MainText(
              context.l10n.please_select_at_least_one_specialization,
            ),
            backgroundColor: AppColors.red,
          ),
        );
        return;
      }

      final name = _nameController.text;
      final avatar =
          name.isNotEmpty
              ? name.trim().split(' ').map((l) => l[0]).take(2).join()
              : '??';

      final newDistributor = Distributor(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        emergencyContact: _emergencyContactController.text,
        experience: _experienceController.text,
        region: selectedRegion,
        vehicleType: selectedVehicleType,
        status: selectedStatus,
        languages: selectedLanguages,
        specialization: selectedSpecializations,
        rating: 0.0,
        totalDistributions: 0,
        lastDistribution: DateTime.now(),
        joinDate: DateTime.now(),
        avatar: avatar.toUpperCase(),
        availabilityStatus: context.l10n.available,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MainText(
            '${context.l10n.distributor} "$name" ${context.l10n.added_successfully}',
          ),
          backgroundColor: AppColors.green,
        ),
      );
      Navigator.pop(context, newDistributor);
    }
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
