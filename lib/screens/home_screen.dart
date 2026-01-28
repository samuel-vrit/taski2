import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:taski/constants/app_colors.dart';
import 'package:taski/providers/task_provider.dart';
import 'package:taski/utils/tasks.dart';
import 'package:taski/widgets/to_do_element_widget.dart';

import '../constants/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allTasks = context.watch<TaskProvider>().allTasks;
    final doneTasks = context.watch<TaskProvider>().doneTasks;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Welcome, ', style: kHeadingTextStyle1),
                    TextSpan(
                      text: 'John',
                      style: kHeadingTextStyle1.copyWith(
                        color: AppColors.themeColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                'You’ve got ${allTasks.length - doneTasks.length} tasks to do.',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: AppColors.themeColor,
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: allTasks.length,
                  separatorBuilder: (_, __) {
                    return SizedBox(height: 16);
                  },
                  itemBuilder: (context, index) {
                    return TodoElementWidget(task: allTasks[index]);
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
