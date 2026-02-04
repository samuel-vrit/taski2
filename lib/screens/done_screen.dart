import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski/constants/app_constants.dart';
import 'package:taski/providers/task_provider.dart';
import 'package:taski/widgets/delete_task_element.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doneTasks = context.watch<TaskProvider>().doneTasks;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Completed Tasks', style: kHeadingTextStyle1),
                  GestureDetector(
                    onTap: () {},
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<TaskProvider>().deleteDoneTasks();
                      },
                      child: Text(
                        'Delete all',
                        style: kBodyTextStyle.copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              context.watch<TaskProvider>().fetchStatus
                  ? Expanded(child: Center(child: CircularProgressIndicator()))
                  : Expanded(
                      child: ListView.separated(
                        itemCount: doneTasks.length,
                        itemBuilder: (context, index) =>
                            DeleteTaskElement(task: doneTasks[index]),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
