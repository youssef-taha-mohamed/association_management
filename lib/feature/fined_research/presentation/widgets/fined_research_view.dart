import 'package:flutter/material.dart';
import 'package:management/core/style/app_colors.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';

import '../../data/db/database_helper.dart';
import '../../data/model/case_model.dart';
import 'add_case_page.dart';

class FinedResearchView extends StatefulWidget {
  static const String routeName = '/find-research-view';

  const FinedResearchView({super.key});

  @override
  State<FinedResearchView> createState() => _FinedResearchViewState();
}

class _FinedResearchViewState extends State<FinedResearchView> {
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
                  columns:  [
                    DataColumn(
                      label: MainText(context.l10n.name,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    DataColumn(
                        label: MainText(
                            context.l10n.age,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    DataColumn(
                        label: MainText(
                            context.l10n.phone_number,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    DataColumn(
                        label: MainText(
                            context.l10n.address,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    DataColumn(label: MainText(
                      context.l10n.governorate,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    DataColumn(label: MainText(
                      context.l10n.the_area,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    DataColumn(label: MainText(
                      context.l10n.category,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    DataColumn(label: MainText(
                    context.l10n.number_of_criteria,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    DataColumn(label: MainText(
                      context.l10n.donations ,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    DataColumn(label: MainText(
                      context.l10n.project_name,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    DataColumn(label: MainText(
                      context.l10n.the_condition,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    DataColumn(label: MainText(
                      context.l10n.activation,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    DataColumn(label: MainText(
                      context.l10n.complete_the_data,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
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
                                c.hasProject ? context.l10n.he_has_a_project : context.l10n.he_has_no_project,

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
            final result = await Navigator.pushNamed(context, AddCasePage.routeName);

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (_) =>  AddCasePage()),
            // );
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
