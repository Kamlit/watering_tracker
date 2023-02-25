import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    super.key,
    required this.data,
  });

  final DiaryData data;
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          
        ),
      ),
    );
  }
}
