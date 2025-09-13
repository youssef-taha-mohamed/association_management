import 'package:flutter/material.dart';
import 'package:management/core/style/app_colors.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/easy_button.dart';
import 'package:management/shared/widgets/main_text.dart';
import 'package:management/shared/widgets/main_textfield.dart';

import '../../data/db/database_helper.dart';
import '../../data/model/case_model.dart';

class AddCasePage extends StatefulWidget {
  const AddCasePage({super.key});

  static const String routeName = 'add-new-case';

  @override
  State<AddCasePage> createState() => _AddCasePageState();
}

class _AddCasePageState extends State<AddCasePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final nameFocus= FocusNode();
  final TextEditingController ageCtrl = TextEditingController();
  final ageFocus= FocusNode();
  final TextEditingController phoneCtrl = TextEditingController();
  final phoneFocus= FocusNode();
  final TextEditingController addressCtrl = TextEditingController();
  final addressFocus=FocusNode();
  final TextEditingController governorateCtrl = TextEditingController();
  final governorateFocus=FocusNode();
  final TextEditingController areaCtrl = TextEditingController();
  final areaFocus=FocusNode();
  final TextEditingController categoryCtrl = TextEditingController();
  final categoryFocus=FocusNode();
  final TextEditingController criteriaCtrl = TextEditingController();
  final criteriaFocus=FocusNode();
  final TextEditingController donationCtrl = TextEditingController();
  final donationFocus=FocusNode();
  final TextEditingController statusCtrl = TextEditingController();
  final statusFocus=FocusNode();

  bool hasProject = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: MainText(
          context.l10n.add_new,
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
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 8,
              children: [
                MainTextField(
                  controller: nameCtrl,
                  currentFocusNode: nameFocus,
                  nextFocusNode: ageFocus,
                 label:  context.l10n.name,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return context.l10n.name_required;
                    }else{
                      return null;
                    }
                  } ,
                ),
                MainTextField(
                   controller:  ageCtrl,
                   currentFocusNode: ageFocus,
                   nextFocusNode: phoneFocus,
                   label:  context.l10n.age,
                  keyboardType: TextInputType.number,
                  validator: (value){
                     if(value==null||value.isEmpty){
                       return context.l10n.age_required;
                     }else{
                       return null;
                     }
                  },
                ),
                MainTextField(
                    controller: phoneCtrl,
                    currentFocusNode: phoneFocus,
                    nextFocusNode: addressFocus,
                    label:  context.l10n.phone_number,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return context.l10n.phone_number_required;
                    }else{
                      return null;
                    }
                  },
                ),
                MainTextField(
                    controller: addressCtrl,
                    currentFocusNode: addressFocus,
                    nextFocusNode: governorateFocus,
                    label:  context.l10n.address,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return context.l10n.address_required;
                    }else{
                      return null;
                    }
                  },
                ),
                MainTextField(
                    controller: governorateCtrl,
                   currentFocusNode: governorateFocus,
                   nextFocusNode: areaFocus,
                   label:  context.l10n.governorate,
                  validator: (value){
                      if(value==null||value.isEmpty){
                        return context.l10n.governorate_required;
                      }else{
                        return null;
                      }
                  },
                ),
                MainTextField(
                    controller: areaCtrl,
                   currentFocusNode: areaFocus,
                   nextFocusNode: categoryFocus,
                   label:  context.l10n.the_area,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return context.l10n.the_area_required;
                    }else{
                      return null;
                    }
                  },
                ),
                MainTextField(
                    controller: categoryCtrl,
                    currentFocusNode: categoryFocus,
                    nextFocusNode: criteriaFocus,
                    label:  context.l10n.category,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return context.l10n.category_required;
                    }else{
                      return null;
                    }
                  },
                ),
                MainTextField(
                    controller: criteriaCtrl,
                    currentFocusNode: criteriaFocus,
                    nextFocusNode: donationFocus,
                    label: context.l10n.number_of_criteria,
                  keyboardType: TextInputType.number,
                  validator: (value){
                      if(value==null||value.isEmpty){
                        return context.l10n.number_criteria_required;
                      }else{
                        return null;
                      }
                  },
                ),
                MainTextField(
                    controller: donationCtrl,
                   currentFocusNode: donationFocus,
                   nextFocusNode: statusFocus,
                   label:  context.l10n.donations ,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return context.l10n.donations_required;
                    }else{
                      return null;
                    }
                  },
                ),
                SwitchListTile(
                  title:  MainText(context.l10n.does_he_have_a_project),
                  value: hasProject,
                  inactiveThumbColor: AppColors.black,
                  contentPadding: EdgeInsets.zero,
                  inactiveTrackColor: AppColors.grey3,
                  onChanged: (val) => setState(() => hasProject = val),
                ),
                MainTextField(
                    controller: statusCtrl,
                   currentFocusNode: statusFocus,
                   nextFocusNode: null,
                   label:  context.l10n.the_condition,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return context.l10n.the_condition_required;
                    }else{
                      return null;
                    }
                  },
                ),
                SwitchListTile(
                  title:  MainText(context.l10n.is_activated),
                  value: isActive,
                  inactiveThumbColor: AppColors.black,
                  inactiveTrackColor: AppColors.grey3,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (val) => setState(() => isActive = val),
                ),
                LoadingButton(
                  onTap: () async {
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
                    name:context.l10n.save,
                ),
              ],
            ),
          ),
        ),

    );
  }
}
