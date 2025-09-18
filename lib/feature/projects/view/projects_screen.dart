import 'package:flutter/material.dart';
import 'package:management/core/style/app_colors.dart';
import 'package:management/l10n/l10n.dart';
import '../../../shared/widgets/main_text.dart';
import '../data/model/small_model.dart';
import 'add_project_dialog.dart';

class ProjectsScreen extends StatefulWidget {
  static const String routeName = '/projects-screen';
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final List<Projects> _projects = [];

  void _openAddProjectDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom:
                MediaQuery.of(
                  context,
                ).viewInsets.bottom, // يرفع المحتوى فوق الكيبورد
          ),
          child: SingleChildScrollView(
            child: AddProjectDialog(
              onSave: (project) {
                setState(() => _projects.add(project));
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildProjectsTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.star, color: AppColors.white, size: 20),
              ),
              const SizedBox(width: 8),
              MainText(
                context.l10n.project_schedule,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 240, 240, 240),
            ),
            border: TableBorder.all(color: Colors.grey),
            columns: [
              DataColumn(
                label: MainText(
                  context.l10n.project_name,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              DataColumn(
                label: MainText(
                  context.l10n.project_income,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              DataColumn(
                label: MainText(
                  context.l10n.name,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ],
            rows:
                _projects.map((p) {
                  return DataRow(
                    cells: [
                      DataCell(Text(p.name)),
                      DataCell(Text(p.income)),
                      DataCell(Text(p.beneficiary)),
                    ],
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MainText(
          context.l10n.charity_management_program,
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: AppColors.primaryColor,
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
        padding: const EdgeInsets.all(8.0),
        child: _buildProjectsTable(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddProjectDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
