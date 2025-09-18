import 'package:flutter/material.dart';
import 'package:management/core/style/app_colors.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import '../../../shared/widgets/main_textfield.dart';
import '../data/model/small_model.dart';

class AddProjectDialog extends StatefulWidget {
  final Function(Projects) onSave;

  const AddProjectDialog({super.key, required this.onSave});

  @override
  State<AddProjectDialog> createState() => _AddProjectDialogState();
}

class _AddProjectDialogState extends State<AddProjectDialog> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  final nameFocus = FocusNode();
  String _income = '';
  final incoomeFocus = FocusNode();
  String _beneficiary = '';
  final beneficiaryFocus = FocusNode();

  void _saveProject() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(
        Projects(name: _name, income: _income, beneficiary: _beneficiary),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      content: SizedBox(
        // width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 8,
            children: [
              MainTextField(
                label: context.l10n.project_name,
                currentFocusNode: beneficiaryFocus,
                nextFocusNode: incoomeFocus,
                onChanged: (val) => _name = val,
                validator:
                    (val) =>
                        val!.isEmpty
                            ? context.l10n.enter_the_project_name
                            : null,
              ),
              MainTextField(
                label: context.l10n.project_income,
                currentFocusNode: incoomeFocus,
                nextFocusNode: nameFocus,
                keyboardType: TextInputType.number,
                onChanged: (val) => _income = val,
                validator:
                    (val) =>
                        val!.isEmpty ? context.l10n.income_value_income : null,
              ),
              MainTextField(
                label: context.l10n.name,
                currentFocusNode: nameFocus,
                nextFocusNode: null,
                onChanged: (val) => _beneficiary = val,
                validator:
                    (val) => val!.isEmpty ? context.l10n.name_required : null,
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        SizedBox(
          width: double.infinity, // الأزرار ياخدوا العرض كله
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: MainText(context.l10n.cancellation),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: MainText(context.l10n.save),
                onPressed: _saveProject,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
