import 'package:flutter/material.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
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
  String _income = '';
  String _beneficiary = '';

  void _saveProject() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(
        Projects(name: _name, income: _income, beneficiary: _beneficiary),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title:  MainText(context.l10n.add_new_project),
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration:  InputDecoration(labelText:context.l10n.project_name ),
              onChanged: (val) => _name = val,
              validator: (val) => val!.isEmpty ? context.l10n.enter_the_project_name : null,
            ),
            TextFormField(
              decoration:  InputDecoration(labelText: context.l10n.project_income),
              keyboardType: TextInputType.number,
              onChanged: (val) => _income = val,
              validator: (val) => val!.isEmpty ? context.l10n.income_value_income : null,
            ),
            TextFormField(
              decoration:  InputDecoration(labelText: context.l10n.name),
              onChanged: (val) => _beneficiary = val,
              validator: (val) => val!.isEmpty ? context.l10n.name_required : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child:  MainText(context.l10n.cancellation),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(child:  MainText(context.l10n.save), onPressed: _saveProject),
      ],
    );
  }
}
