import 'package:drink_tracker/TEMP_amounts.dart';
import 'package:drink_tracker/presentation/screens/home/add_entry/amounts_grid_view.dart';
import 'package:drink_tracker/presentation/screens/home/home_body/custom_amount_window.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class SelectAmountPage extends StatefulWidget {
  const SelectAmountPage({
    super.key,
    required this.onBack,
    required this.onSelected,
  });

  final void Function() onBack;
  final void Function(int amount) onSelected;

  @override
  State<SelectAmountPage> createState() => _SelectAmountPageState();
}

class _SelectAmountPageState extends State<SelectAmountPage> {
  void _showCustomAmountWindow() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return CustomAmountWindow(
          onSelected: (amount) {
            widget.onSelected(amount);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: AppColors.white,
                        onPressed: widget.onBack,
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Amount',
                  style: AppTextStyle.h2,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: AmountsGridView(
                  onSelected: widget.onSelected,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greyDark,
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppBorderRadius.all,
                      ),
                    ),
                    onPressed: _showCustomAmountWindow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          Icons.tune,
                          color: AppColors.greyLight,
                        ),
                        Text(
                          'Add custom amount',
                          style: AppTextStyle.h3,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
