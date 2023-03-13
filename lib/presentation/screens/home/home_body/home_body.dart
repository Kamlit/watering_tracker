import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/screens/home/home_body/add_button.dart';
import 'package:drink_tracker/presentation/screens/home/home_body/mililitres_progress.dart';
import 'package:drink_tracker/presentation/screens/home/home_body/semi_circular_progress_bar.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({required this.diaryData, super.key});

  final DiaryData diaryData;

  @override
  Widget build(BuildContext context) {
    var isEmpty = diaryData.entries.isEmpty;
    return isEmpty ? _buildEmptyBody() : _buildBody();
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: MililitresProgress(
            data: diaryData,
          ),
        ),
        const Expanded(
          flex: 2,
          child: AddButton(),
        ),
        Expanded(
          flex: 8,
          child: SemiCircularProgressBar(
            padding: 35,
            data: diaryData,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyBody() {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: MililitresProgress(
            data: diaryData,
          ),
        ),
        const Expanded(
          flex: 2,
          child: AddButton(),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(
                  child: Image(
                    image: AssetImage('assets/images/arrow.png'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Click the button',
                  style: AppTextStyle.h3,
                ),
                Text(
                  'to add first entry',
                  style: AppTextStyle.h3,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
