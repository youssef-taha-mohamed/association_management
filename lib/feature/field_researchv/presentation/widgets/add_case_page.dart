import 'package:flutter/material.dart';
import 'package:management/core/style/app_colors.dart';
import 'package:management/feature/field_researchv/data/db/database_helper.dart';
import 'package:management/feature/field_researchv/data/model/case_model.dart';
import 'package:management/shared/widgets/main_text.dart';
import 'package:management/shared/widgets/main_textfield.dart';

class AddCasePage extends StatefulWidget {
  const AddCasePage({super.key});

  @override
  State<AddCasePage> createState() => _AddCasePageState();
}

class _AddCasePageState extends State<AddCasePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController governorateCtrl = TextEditingController();
  final TextEditingController areaCtrl = TextEditingController();
  final TextEditingController categoryCtrl = TextEditingController();
  final TextEditingController criteriaCtrl = TextEditingController();
  final TextEditingController donationCtrl = TextEditingController();
  final TextEditingController statusCtrl = TextEditingController();

  bool hasProject = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: MainText(
          "إضافة حالة جديدة",
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: AppColors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(nameCtrl, "اسم المستحق"),
              _buildTextField(ageCtrl, "العمر", isNumber: true),
              _buildTextField(phoneCtrl, "رقم الموبايل"),
              _buildTextField(addressCtrl, "العنوان"),
              _buildTextField(governorateCtrl, "المحافظة"),
              _buildTextField(areaCtrl, "المنطقة"),
              _buildTextField(categoryCtrl, "الفئة الأساسية"),
              _buildTextField(criteriaCtrl, "عدد المعايير", isNumber: true),
              _buildTextField(donationCtrl, "قيمة التبرعات", isNumber: true),
              SwitchListTile(
                title: const MainText("لديه مشروع"),
                value: hasProject,
                onChanged: (val) => setState(() => hasProject = val),
              ),
              _buildTextField(statusCtrl, "الحالة"),
              SwitchListTile(
                title: const MainText("مفعل"),
                value: isActive,
                onChanged: (val) => setState(() => isActive = val),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final caseModel = CaseModel(
                      name: nameCtrl.text,
                      age: int.parse(ageCtrl.text),
                      phone: phoneCtrl.text,
                      address: addressCtrl.text,
                      governorate: governorateCtrl.text,
                      area: areaCtrl.text,
                      category: categoryCtrl.text,
                      criteriaCount: int.parse(criteriaCtrl.text),
                      donationValue: double.parse(donationCtrl.text),
                      hasProject: hasProject,
                      status: statusCtrl.text,
                      isActive: isActive,
                    );
                    await DatabaseHelper.instance.insertCase(caseModel);
                    Navigator.pop(context, true);
                  }
                },
                child: const MainText("حفظ"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: MainTextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        label: label,
        validator: (val) => val == null || val.isEmpty ? "مطلوب" : null,
      ),
    );
  }
}
