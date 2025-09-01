import 'package:flutter/material.dart';
import 'package:management/feature/small_projects/data/model/small_model.dart';

import 'add_project_dialog.dart';

class SmallProjectsPage extends StatefulWidget {
  static const String routeName = '/small_paojects';
  const SmallProjectsPage({super.key});

  @override
  State<SmallProjectsPage> createState() => _SmallProjectsPageState();
}

class _SmallProjectsPageState extends State<SmallProjectsPage> {
  final List<SmallModel> _projects = [];

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
        title: const Text(
          'برنامج إدارة الجمعيات الخيرية',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.blue,
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
