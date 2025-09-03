import 'package:flutter/material.dart';
import 'package:management/feature/small_projects/data/model/small_model.dart';

class AddProjectDialog extends StatefulWidget {
  final Function(SmallModel) onSave;

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
        SmallModel(name: _name, income: _income, beneficiary: _beneficiary),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text("إضافة مشروع جديد"),
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "اسم المشروع"),
              onChanged: (val) => _name = val,
              validator: (val) => val!.isEmpty ? "أدخل اسم المشروع" : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "دخل المشروع"),
              keyboardType: TextInputType.number,
              onChanged: (val) => _income = val,
              validator: (val) => val!.isEmpty ? "أدخل الدخل" : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "اسم المستحق"),
              onChanged: (val) => _beneficiary = val,
              validator: (val) => val!.isEmpty ? "أدخل اسم المستحق" : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("إلغاء"),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(child: const Text("حفظ"), onPressed: _saveProject),
      ],
    );
  }
}
