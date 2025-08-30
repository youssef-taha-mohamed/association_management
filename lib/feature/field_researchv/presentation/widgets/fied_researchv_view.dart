import 'package:flutter/material.dart';
import 'package:management/feature/field_researchv/data/db/database_helper.dart';
import 'package:management/feature/field_researchv/data/model/case_model.dart';
import 'package:management/feature/field_researchv/presentation/widgets/add_case_page.dart';

class FiedResearchvView extends StatefulWidget {
  static const String routeName = '/field_research';

  const FiedResearchvView({super.key});

  @override
  State<FiedResearchvView> createState() => _FiedResearchvViewState();
}

class _FiedResearchvViewState extends State<FiedResearchvView> {
  List<CaseModel> cases = [];

  @override
  void initState() {
    super.initState();
    _loadCases();
  }

  Future<void> _loadCases() async {
    final data = await DatabaseHelper.instance.getCases();
    setState(() {
      cases = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // اتجاه عربي
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("برنامج ادارة الجمعيات الخيرية"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // افتح القائمة الجانبية
            },
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "بيانات المستحقين",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                DataTable(
                  border: TableBorder.all(color: Colors.black, width: 1),
                  columns: const [
                    DataColumn(label: Text("الاسم")),
                    DataColumn(label: Text("العمر")),
                    DataColumn(label: Text("الموبايل")),
                    DataColumn(label: Text("العنوان")),
                    DataColumn(label: Text("المحافظة")),
                    DataColumn(label: Text("المنطقة")),
                    DataColumn(label: Text("الفئة")),
                    DataColumn(label: Text("عدد المعايير")),
                    DataColumn(label: Text("قيمة التبرعات")),
                    DataColumn(label: Text("المشروع")),
                    DataColumn(label: Text("الحالة")),
                    DataColumn(label: Text("تفعيل")),
                    DataColumn(label: Text("استكمال البيانات")),
                  ],
                  rows:
                      cases.map((c) {
                        return DataRow(
                          cells: [
                            DataCell(Text(c.name)),
                            DataCell(Text("${c.age}")),
                            DataCell(Text(c.phone)),
                            DataCell(Text(c.address)),
                            DataCell(Text(c.governorate)),
                            DataCell(Text(c.area)),
                            DataCell(Text(c.category)),
                            DataCell(Text("${c.criteriaCount}")),
                            DataCell(Text("${c.donationValue}")),
                            DataCell(
                              Text(
                                c.hasProject ? "لديه مشروع" : "ليس لديه مشروع",
                                style: TextStyle(
                                  color:
                                      c.hasProject ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(Text(c.status)),
                            DataCell(
                              Icon(
                                c.isActive ? Icons.check : Icons.close,
                                color: c.isActive ? Colors.green : Colors.red,
                              ),
                            ),
                            DataCell(
                              IconButton(
                                icon: const Icon(
                                  Icons.view_sidebar,
                                  color: Colors.blue,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddCasePage()),
            );
            if (result == true) {
              _loadCases();
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
