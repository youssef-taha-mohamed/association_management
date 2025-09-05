import 'package:flutter/material.dart';
import 'package:management/core/style/app_colors.dart';
import 'package:management/feature/field_researchv/data/db/database_helper.dart';
import 'package:management/feature/field_researchv/data/model/case_model.dart';
import 'package:management/feature/field_researchv/presentation/widgets/add_case_page.dart';
import 'package:management/shared/widgets/main_text.dart';

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
          backgroundColor: AppColors.primaryColor,
          title: MainText(
            "برنامج ادارة الجمعيات الخيرية",
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
                      const MainText(
                        "بيانات المستحقين",

                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                DataTable(
                  border: TableBorder.all(color: Colors.black, width: 1),
                  columns: const [
                    DataColumn(label: MainText("الاسم")),
                    DataColumn(label: MainText("العمر")),
                    DataColumn(label: MainText("الموبايل")),
                    DataColumn(label: MainText("العنوان")),
                    DataColumn(label: MainText("المحافظة")),
                    DataColumn(label: MainText("المنطقة")),
                    DataColumn(label: MainText("الفئة")),
                    DataColumn(label: MainText("عدد المعايير")),
                    DataColumn(label: MainText("قيمة التبرعات")),
                    DataColumn(label: MainText("المشروع")),
                    DataColumn(label: MainText("الحالة")),
                    DataColumn(label: MainText("تفعيل")),
                    DataColumn(label: MainText("استكمال البيانات")),
                  ],
                  rows:
                      cases.map((c) {
                        return DataRow(
                          cells: [
                            DataCell(MainText(c.name)),
                            DataCell(MainText("${c.age}")),
                            DataCell(MainText(c.phone)),
                            DataCell(MainText(c.address)),
                            DataCell(MainText(c.governorate)),
                            DataCell(MainText(c.area)),
                            DataCell(MainText(c.category)),
                            DataCell(MainText("${c.criteriaCount}")),
                            DataCell(MainText("${c.donationValue}")),
                            DataCell(
                              MainText(
                                c.hasProject ? "لديه مشروع" : "ليس لديه مشروع",

                                color: c.hasProject ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            DataCell(MainText(c.status)),
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
