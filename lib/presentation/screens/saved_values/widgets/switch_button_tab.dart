import 'package:drink_tracker/logic/cubits/saved_values/saved_values_cubit.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchButtonTab extends StatelessWidget {
  const SwitchButtonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: AppBorderRadius.all,
          ),
          color: AppColors.greyDark,
          child: BlocBuilder<SavedValuesCubit, SavedValuesState>(
            // buildWhen: (previous, current) => previous.tab != current.tab,
            builder: (context, state) {
              var currentTab = state.tab;
              print(state.tab);
              return Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(AppBorderRadius.value),
                          ),
                        ),
                      ),
                      onPressed: () {
                        print(123);
                        context.read<SavedValuesCubit>().changeTab(
                              SavedValuesTab.drinkTypes,
                            );
                      },
                      child: Center(
                        child: Text(
                          'Drink types',
                          style: currentTab == SavedValuesTab.drinkTypes
                              ? AppTextStyle.h2
                              : AppTextStyle.h3,
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    width: 2,
                    thickness: 2,
                    color: AppColors.greyLight,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(AppBorderRadius.value),
                          ),
                        ),
                      ),
                      onPressed: () {
                        context.read<SavedValuesCubit>().changeTab(
                              SavedValuesTab.amounts,
                            );
                      },
                      child: Center(
                        child: Text(
                          'Amounts',
                          style: currentTab == SavedValuesTab.amounts
                              ? AppTextStyle.h2
                              : AppTextStyle.h3,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
