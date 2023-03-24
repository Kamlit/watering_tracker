import 'package:drink_tracker/logic/cubits/saved_values/saved_values_cubit.dart';
import 'package:drink_tracker/presentation/drawer/app_drawer.dart';
import 'package:drink_tracker/presentation/routing/router.dart';
import 'package:drink_tracker/presentation/screens/home/add_entry/amounts_grid_view.dart';
import 'package:drink_tracker/presentation/screens/home/add_entry/drink_types_grid_view.dart';
import 'package:drink_tracker/presentation/screens/saved_values/widgets/saved_values_app_bar.dart';
import 'package:drink_tracker/presentation/screens/saved_values/widgets/switch_button_tab.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedValuesScreen extends StatefulWidget {
  const SavedValuesScreen({super.key});

  @override
  State<SavedValuesScreen> createState() => _SavedValuesScreenState();
}

class _SavedValuesScreenState extends State<SavedValuesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      backgroundColor: AppColors.backgroundColor,
      appBar: const SavedValuesAppBar(
        height: 80,
      ),
      body: Column(
        children: [
          const SwitchButtonTab(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<SavedValuesCubit, SavedValuesState>(
                builder: (context, state) {
                  return state.tab == SavedValuesTab.amounts
                      ? AmountsGridView(
                          onSelected: (amount) {},
                        )
                      : DrinkTypesGridView(
                          onSelected: (drinkType) {},
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
