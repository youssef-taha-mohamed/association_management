import 'package:flutter/material.dart';
import 'package:management/core/style/app_colors.dart';
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
    showDialog(
      context: context,
      builder:
          (context) => AddProjectDialog(
            onSave: (project) {
              setState(() => _projects.add(project));
            },
          ),
    );
  }

  Widget _buildProjectsTable() {
    if (_projects.isEmpty) {
      return const Center(
        child: Text("لا توجد مشاريع بعد، اضغط على + للإضافة."),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(
          const Color.fromARGB(255, 240, 240, 240),
        ),
        border: TableBorder.all(color: Colors.grey),
        columns: const [
          DataColumn(
            label: Text(
              "اسم المشروع",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              "دخل المشروع",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              "اسم المستحق",
              style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MainText(
          'برنامج إدارة الجمعيات الخيرية',
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
