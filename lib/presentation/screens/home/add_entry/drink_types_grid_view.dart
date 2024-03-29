import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/cubits/edit_drink_type/edit_drink_type_cubit.dart';
import 'package:drink_tracker/logic/cubits/saved_values/saved_values_cubit.dart';
import 'package:drink_tracker/logic/helpers/extensions.dart';
import 'package:drink_tracker/logic/models/drink_type.dart';
import 'package:drink_tracker/presentation/routing/routes.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/new_drink_type_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrinkTypesGridView extends StatelessWidget {
  const DrinkTypesGridView({
    super.key,
    required this.onSelected,
  });

  final void Function(DrinkType selected) onSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2,
      ),
      itemCount: drinkTypes.length + 1,
      itemBuilder: (context, index) {
        return index < drinkTypes.length
            ? InkWell(
                onTap: () => onSelected(drinkTypes[index]),
                child: GridTile(
                  footer: Icon(
                    Icons.circle,
                    size: 9,
                    color: drinkTypes[index].color.toColor(),
                  ),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppBorderRadius.all,
                    ),
                    color: AppColors.greyDark,
                    child: Center(
                      child: Text(
                        drinkTypes[index].name,
                        style: AppTextStyle.h3,
                      ),
                    ),
                  ),
                ),
              )
            : InkWell(
                onTap: () => {
                  showDialog<void>(
                    context: context,
                    builder: (_) => MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                          value: BlocProvider.of<SavedValuesCubit>(context),
                        ),
                        BlocProvider(
                          create: (_) => EditDrinkTypeCubit(),
                        ),
                      ],
                      child: const NewDrinkTypeWindow(),
                    ),
                  ),
                },
                child: const GridTile(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: AppBorderRadius.all,
                    ),
                    color: AppColors.greyDark,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
