import 'package:drink_tracker/TEMP_amounts.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class AmountsGridView extends StatelessWidget {
  const AmountsGridView({
    super.key,
    required this.onSelected,
  });

  final void Function(int amount) onSelected;

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
      itemCount: amounts.length + 1,
      itemBuilder: (context, index) {
        return index < amounts.length
            ? InkWell(
                onTap: () => onSelected(amounts[index]),
                child: GridTile(
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppBorderRadius.all,
                    ),
                    color: AppColors.greyDark,
                    child: Center(
                      child: Text(
                        '${amounts[index]} ml',
                        style: AppTextStyle.h3,
                      ),
                    ),
                  ),
                ),
              )
            : InkWell(
                onTap: () {},
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
