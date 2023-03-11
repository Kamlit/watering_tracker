import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    final pageDate = context.read<PageDateCubit>().state.pageDate;
    var selectedDate = pageDate;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.all,
      ),
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: AppBorderRadius.all,
        ),
        width: 1000,
        height: 400,
        child: SfDateRangePicker(
          initialDisplayDate: pageDate,
          initialSelectedDate: pageDate,
          showNavigationArrow: true,
          maxDate: DateTime.now(),
          headerStyle: const DateRangePickerHeaderStyle(
            textStyle: AppTextStyle.h2,
          ),
          selectionTextStyle: AppTextStyle.h2,
          viewSpacing: 50,
          monthCellStyle: const DateRangePickerMonthCellStyle(
            textStyle: AppTextStyle.h3,
            todayTextStyle: AppTextStyle.h2,
            disabledDatesTextStyle: AppTextStyle.h3dark,
          ),
          monthViewSettings: const DateRangePickerMonthViewSettings(
            viewHeaderHeight: 70,
            viewHeaderStyle: DateRangePickerViewHeaderStyle(
              textStyle: AppTextStyle.h2,
            ),
          ),
          yearCellStyle: const DateRangePickerYearCellStyle(
            textStyle: AppTextStyle.h3,
            todayTextStyle: AppTextStyle.h3,
            disabledDatesTextStyle: AppTextStyle.h3dark,
          ),
          onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
            if (args.value is DateTime) {
              selectedDate = args.value as DateTime;
            }
          },
        ),
      ),
      actionsPadding: const EdgeInsets.only(top: 20),
      actions: [
        Container(
          width: 400,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: AppBorderRadius.all,
          ),
          child: TextButton(
            onPressed: () {
              context.read<PageDateCubit>().requestPageJump(
                    newPageDate: selectedDate,
                  );
              Navigator.of(context).pop();
            },
            child: const Text('GO'),
          ),
        ),
      ],
    );
  }
}
