import 'package:flutter/material.dart';
import 'package:keyboard_area_handler/keyboard_area_handler.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_textfield.dart';

import '../../../../../core/style/app_colors.dart';
import '../../../../../shared/widgets/main_text.dart' show MainText;

class AddBeneficiaryForm extends StatefulWidget {
  const AddBeneficiaryForm({super.key});

  @override
  State<AddBeneficiaryForm> createState() => _AddBeneficiaryFormState();
}

class _AddBeneficiaryFormState extends State<AddBeneficiaryForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final _incomeController = TextEditingController();
  final _dependentsController = TextEditingController();

  String selectedCategory = 'Family';
  String selectedStatus = 'Pending';

  List<String> categories = ['Family', 'Elderly', 'Orphan', 'Disabled'];
  List<String> statuses = ['Active', 'Pending', 'Inactive'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MainText(context.l10n.add_beneficiary, color: AppColors.white),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: KeyboardAreaHandler(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: .05),
                        blurRadius: 10,
                        offset: Offset(0, 2),
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
                        prefixIcon: Icon(Icons.person),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return context.l10n.please_enter_full_name;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      MainTextField(
                        controller: _phoneController,
                        label: context.l10n.phone_number,
                        prefixIcon: Icon(Icons.phone),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return context.l10n.please_enter_your_phone_number;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      MainTextField(
                        controller: _locationController,
                        label: context.l10n.location_address,
                        prefixIcon: Icon(Icons.location_on),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return context.l10n.please_enter_location;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: selectedCategory,
                              decoration: InputDecoration(
                                labelText: context.l10n.category,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Icon(Icons.category),
                              ),
                              items:
                                  categories
                                      .map(
                                        (category) => DropdownMenuItem(
                                          value: category,
                                          child: MainText(category),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value!;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: selectedStatus,
                              decoration: InputDecoration(
                                labelText: context.l10n.status,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: Icon(Icons.flag),
                              ),
                              items:
                                  statuses
                                      .map(
                                        (status) => DropdownMenuItem(
                                          value: status,
                                          child: MainText(status),
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
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText(
                        context.l10n.financial_information,

                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: MainTextField(
                              controller: _incomeController,
                              label: context.l10n.monthly_income,
                              prefixIcon: Icon(Icons.attach_money),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return context.l10n.please_enter_income;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: MainTextField(
                              controller: _dependentsController,
                              label: context.l10n.number_dependents,
                              prefixIcon: Icon(Icons.family_restroom),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return context
                                      .l10n
                                      .please_enter_dependents_count;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(color: Colors.grey.shade400),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: MainText(context.l10n.cancel),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveBeneficiary,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade600,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: MainText(context.l10n.save_beneficiary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveBeneficiary() {
    if (_formKey.currentState?.validate() ?? false) {
      // Save beneficiary logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MainText(context.l10n.beneficiary_saved_successfully),
          backgroundColor: AppColors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _incomeController.dispose();
    _dependentsController.dispose();
    super.dispose();
  }
}
