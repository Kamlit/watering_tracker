import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

enum SavedValuesTab { drinkTypes, amounts }

class SwitchButtonTab extends StatefulWidget {
  const SwitchButtonTab({super.key});

  @override
  State<SwitchButtonTab> createState() => _SwitchButtonTabState();
}

class _SwitchButtonTabState extends State<SwitchButtonTab> {
  SavedValuesTab tab = SavedValuesTab.drinkTypes;

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
          child: Row(
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
                    tab = SavedValuesTab.drinkTypes;
                    setState(() {});
                  },
                  child: Center(
                    child: Text(
                      'Drink types',
                      style: tab == SavedValuesTab.drinkTypes
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
                    tab = SavedValuesTab.amounts;
                    setState(() {});
                  },
                  child: Center(
                    child: Text(
                      'Amounts',
                      style: tab == SavedValuesTab.amounts
                          ? AppTextStyle.h2
                          : AppTextStyle.h3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
