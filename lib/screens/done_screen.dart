import 'package:flutter/material.dart';
import 'package:taski/constants/app_colors.dart';
import 'package:taski/constants/app_constants.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
                      child: Text(
                        'Delete all',
                        style: kBodyTextStyle.copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: 7,
                  itemBuilder: (context, index) => DeleteTaskElement(),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteTaskElement extends StatelessWidget {
  const DeleteTaskElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.backGroundGrey,
      ),
      child: Row(
        children: [
          // Checkbox(
          //   value: true,
          //   side: BorderSide(color: Colors.grey, width: 2),
          //   onChanged: (val) {},
          // ),
          SizedBox(width: 16),
          Text(
            'Deleted task',
            style: kBodyTextStyle.copyWith(color: AppColors.textColor02),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
