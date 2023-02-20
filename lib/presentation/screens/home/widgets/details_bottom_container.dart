import 'package:drink_tracker/logic/cubits/details_cubit.dart/details_cubit.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsBottomContainer extends StatelessWidget {
  const DetailsBottomContainer({
    required this.height,
    required this.width,
    required this.topPartHeight,
    super.key,
  });

  final double height;
  final double width;
  final double topPartHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: topPartHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<DetailsCubit, DetailsState>(
                  builder: (context, state) {
                    return Icon(
                      state == DetailsHidden()
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: AppColors.white,
                    );
                  },
                ),
                const Text(
                  'Details',
                  style: AppTextStyle.h2,
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
