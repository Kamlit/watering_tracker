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
            child: BlocBuilder<DetailsCubit, DetailsState>(
              builder: (context, state) {
                return state == DetailsHidden() ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_drop_up_sharp,
                      color: AppColors.white,
                    ),
                    Text(
                      'Details',
                      style: AppTextStyle.h2,
                    ),
                  ],
                ) :  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: AppColors.white,
                    ),
                    Text(
                      'Details',
                      style: AppTextStyle.h2,
                    ),
                  ],
                );
              },
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
