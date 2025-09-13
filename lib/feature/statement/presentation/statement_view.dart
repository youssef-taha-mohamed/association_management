import 'package:flutter/material.dart';
import 'package:management/core/style/app_colors.dart';
import 'package:management/l10n/l10n.dart';
import 'package:management/shared/widgets/main_text.dart';
import '../data/coin.dart';
import 'widgets/add_statement_screen.dart';

class StatementScreen extends StatefulWidget {
  static const String routeName = '/field_research';

  const StatementScreen({super.key});

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  final List<StatementModel> _data = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: MainText(
            "كشف الحالات",
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
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: DataTable(
                  border: TableBorder.all(color: Colors.black, width: 1),
                  columns: [
                    DataColumn(
                      label: MainText(
                        context.l10n.name,
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
                    DataColumn(
                      label: MainText(
                        context.l10n.region,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DataColumn(
                      label: MainText(
                        context.l10n.category,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DataColumn(
                      label: MainText(
                        context.l10n.net_income,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DataColumn(
                      label: MainText(
                        context.l10n.donations,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DataColumn(
                      label: MainText(
                        context.l10n.project_name,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DataColumn(
                      label: MainText(
                        context.l10n.the_condition,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DataColumn(
                      label: MainText(
                        context.l10n.active,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  rows:
                      _data.map((caseItem) {
                        return DataRow(
                          cells: [
                            DataCell(Text(caseItem.name)),
                            DataCell(Text(caseItem.age.toString())),
                            DataCell(Text(caseItem.phone)),
                            DataCell(Text(caseItem.address)),
                            DataCell(Text(caseItem.area)),
                            DataCell(Text(caseItem.category)),
                            DataCell(Text(caseItem.income.toString())),
                            DataCell(Text(caseItem.donation.toString())),
                            DataCell(Text(caseItem.hasProject ? "نعم" : "لا")),
                            DataCell(Text(caseItem.status)),
                            DataCell(Text(caseItem.isActive ? "نعم" : "لا")),
                          ],
                        );
                      }).toList(),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final newCase = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddDetectionPage()),
            );
            if (newCase != null && newCase is StatementModel) {
              setState(() {
                _data.add(newCase);
              });
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
