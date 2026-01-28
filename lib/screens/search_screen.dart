import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski/constants/app_colors.dart';
import 'package:taski/providers/task_provider.dart';
import 'package:taski/widgets/to_do_element_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final filteredTasks = context.watch<TaskProvider>().filteredTasks;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search tasks',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.themeColor),
                  ),
                ),

                onChanged: (val) {
                  context.read<TaskProvider>().filterTasks(val);
                },
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: filteredTasks.length,
                  separatorBuilder: (_, __) {
                    return SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    return TodoElementWidget(task: filteredTasks[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
