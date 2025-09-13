import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../shared/widgets/easy_button.dart';
import '../../../../shared/widgets/main_text.dart';
import '../../../../shared/widgets/main_textfield.dart';
import '../../data/coin.dart';

class AddDetectionPage extends StatefulWidget {
  const AddDetectionPage({super.key});

  @override
  State<AddDetectionPage> createState() => _AddDetectionPageState();
}

class _AddDetectionPageState extends State<AddDetectionPage> {
  final nameController = TextEditingController();
  final nameFocus= FocusNode();
  final ageController = TextEditingController();
  final ageFocus= FocusNode();
  final phoneController = TextEditingController();
  final phoneFocus= FocusNode();
  final addressController = TextEditingController();
  final addressFocus=FocusNode();
  final areaController = TextEditingController();
  final areaFocus=FocusNode();
  final categoryController = TextEditingController();
  final categoryFocus=FocusNode();
  final incomeController = TextEditingController();
  final incomeFocus=FocusNode();
  final donationController = TextEditingController();
  final donationFocus=FocusNode();
  final statusController = TextEditingController();
  final statusFocus=FocusNode();

  bool hasProject = false;
  bool isActive = false;

  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                spacing: 16,
                children: [
                  MainTextField(
                    controller: nameController,
                    currentFocusNode: nameFocus,
                    nextFocusNode: ageFocus,
                    label: context.l10n.name,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return context.l10n.name_required;
                      }else{
                        return null;
                      }
                    },
                  ),
                  MainTextField(
                    controller: ageController,
                    currentFocusNode: ageFocus,
                    nextFocusNode: phoneFocus,
                    label: context.l10n.age,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return context.l10n.age_required;
                      }else{
                        return null;
                      }
                    },
                  ),
                  MainTextField(
                    controller: phoneController,
                    currentFocusNode: phoneFocus,
                    nextFocusNode: addressFocus,
                    label: context.l10n.phone_number,
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
                    controller: addressController,
                    label: context.l10n.address,
                    currentFocusNode: addressFocus,
                    nextFocusNode: areaFocus,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return context.l10n.address_required;
                      }else{
                        return null;
                      }
                    },
                  ),
                  MainTextField(
                    controller: areaController,
                    label: context.l10n.the_area,
                    currentFocusNode: areaFocus,
                    nextFocusNode: categoryFocus,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return context.l10n.the_area_required;
                      }else{
                        return null;
                      }
                    },
                  ),
                  MainTextField(
                    controller: categoryController,
                    label: context.l10n.category,
                    currentFocusNode: categoryFocus,
                    nextFocusNode: incomeFocus,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return context.l10n.category_required;
                      }else{
                        return null;
                      }
                    },

                  ),
                  MainTextField(
                    controller: incomeController,
                    label: context.l10n.net_income,
                    currentFocusNode: incomeFocus,
                    nextFocusNode: donationFocus,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return context.l10n.net_income_required;
                      }else{
                        return null;
                      }
                    },
                  ),
                  MainTextField(
                    controller: donationController,
                    label: context.l10n.donations,
                    currentFocusNode: donationFocus,
                    nextFocusNode: statusFocus,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return context.l10n.donations_required;
                      }else{
                        return null;
                      }
                    },
                  ),
                  MainTextField(
                    controller: statusController,
                    label: context.l10n.the_condition,
                    currentFocusNode: statusFocus,
                    nextFocusNode: null,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return context.l10n.the_condition_required;
                      }else{
                        return null;
                      }
                    },
                  ),
                  SwitchListTile(
                    title: MainText(context.l10n.does_he_have_a_project),
                    value: hasProject,
                    inactiveThumbColor: AppColors.black,
                    inactiveTrackColor: AppColors.grey3,
                    onChanged: (val) => setState(() => hasProject = val),
                    contentPadding: EdgeInsets.only(right: 8),
                  ),
                  SwitchListTile(
                    title: MainText(context.l10n.is_activated),
                    value: isActive,
                    inactiveThumbColor: AppColors.black,
                    contentPadding: EdgeInsets.only(right: 8),
                    inactiveTrackColor: AppColors.grey3,
                    onChanged: (val) => setState(() => isActive = val),
                  ),
                  LoadingButton(
                    onTap: () {
                      if(key.currentState!.validate()){
                        final newCase = StatementModel(
                          name: nameController.text,
                          age: int.tryParse(ageController.text) ?? 0,
                          phone: phoneController.text,
                          address: addressController.text,
                          area: areaController.text,
                          category: categoryController.text,
                          income: double.tryParse(incomeController.text) ?? 0.0,
                          donation: double.tryParse(donationController.text) ?? 0.0,
                          hasProject: hasProject,
                          status: statusController.text,
                          isActive: isActive,
                        );
                        Navigator.pop(context, newCase);
                      }
                    },
                    name:context.l10n.save,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
