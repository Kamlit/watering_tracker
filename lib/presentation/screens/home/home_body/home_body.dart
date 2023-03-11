import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/screens/home/home_body/add_button.dart';
import 'package:drink_tracker/presentation/screens/home/home_body/mililitres_progress.dart';
import 'package:drink_tracker/presentation/screens/home/home_body/semi_circular_progress_bar.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({required this.diaryData, super.key});

  final DiaryData diaryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: MililitresProgress(
            data: diaryData,
          ),
        ),
        const Expanded(
          flex: 3,
          child: AddButton(),
        ),
        Expanded(
          flex: 3,
          child: SemiCircularProgressBar(
            size: 32,
            data: diaryData,
          ),
        ),
      ],
    );
  }
}
