import 'package:flutter/material.dart';
import 'package:management/feature/case_detection/data/coin.dart' show Coin;
import 'package:management/shared/widgets/main_text.dart';

class CaseDetection extends StatefulWidget {
  const CaseDetection({super.key});
  static const routeName = "/case_detection";

  @override
  State<CaseDetection> createState() => _CaseDetectionState();
}

class _CaseDetectionState extends State<CaseDetection> {
  List<Coin> _data = [];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2E7D8A),
          title: MainText(
            "برنامج ادارة الجمعيات الخيرية",
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // افتح القائمة الجانبية
            },
          ),
        ),
        body: _buildUI(),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddForm,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl, // يجعل العرض من اليمين لليسار
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // يسمح بالتمرير الأفقي
          child: DataTable(
            border: TableBorder(
              top: BorderSide(color: Colors.grey),
              horizontalInside: BorderSide(
                color: Colors.grey.shade400,
                width: 0.5,
              ),
              verticalInside: BorderSide(color: Colors.grey, width: 1),
            ),
            columns: _createColumns(),
            rows: _createRows(), // أضف البيانات لاحقًا هنا
          ),
        ),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('الاسم المستحق')),
      DataColumn(label: Text('العمر')),
      DataColumn(label: Text('رقم الموبايل')),
      DataColumn(label: Text('العنوان')),
      DataColumn(label: Text('المحافظة')),
      DataColumn(label: Text('المنطقة')),
      DataColumn(label: Text('فئته الاساسية')),
      DataColumn(label: Text('صافي الدخل')),
      DataColumn(label: Text('قيمة التبرعات بالجنيه')),
      DataColumn(label: Text('لديه مشروع')),
      DataColumn(label: Text('حالة التفاعل')),
    ];
  }

  List<DataRow> _createRows() {
    return _data.map((e) {
      return DataRow(
        cells: [
          DataCell(Text(e.name.toString())),
          DataCell(Text(e.age.toString())),
          DataCell(Text(e.phone.toString())),
          DataCell(Text(e.address.toString())),
          DataCell(Text(e.area.toString())),
          DataCell(Text(e.category.toString())),
          DataCell(Text(e.income.toString())),
          DataCell(Text(e.donation.toString())),
          DataCell(Text(e.hasProject.toString())),
          DataCell(Text(e.status.toString())),
          DataCell(Text(e.isActive.toString())),
        ],
      );
    }).toList();
  }

  void _showAddForm() {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();
    final areaController = TextEditingController();
    final categoryController = TextEditingController();
    final incomeController = TextEditingController();
    final donationController = TextEditingController();
    final statusController = TextEditingController();

    bool hasProject = false;
    bool isActive = false;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('إضافة حالة جديدة'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'الاسم'),
                ),
                TextField(
                  controller: ageController,
                  decoration: InputDecoration(labelText: 'العمر'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'رقم الهاتف'),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'العنوان'),
                ),
                TextField(
                  controller: areaController,
                  decoration: InputDecoration(labelText: 'المنطقة'),
                ),
                TextField(
                  controller: categoryController,
                  decoration: InputDecoration(labelText: 'الفئة'),
                ),
                TextField(
                  controller: incomeController,
                  decoration: InputDecoration(labelText: 'صافي الدخل'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: donationController,
                  decoration: InputDecoration(labelText: 'التبرعات'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: statusController,
                  decoration: InputDecoration(labelText: 'الحالة'),
                ),
                SwitchListTile(
                  title: Text("هل لديه مشروع؟"),
                  value: hasProject,
                  onChanged: (val) {
                    setState(() {
                      hasProject = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("هل مفعل؟"),
                  value: isActive,
                  onChanged: (val) {
                    setState(() {
                      isActive = val;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('إلغاء'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('حفظ'),
              onPressed: () {
                setState(() {
                  _data.add(
                    Coin(
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
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
