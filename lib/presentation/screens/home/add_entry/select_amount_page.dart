import 'package:drink_tracker/TEMP_amounts.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/custom_amount_window.dart';
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
        return const CustomAmountWindow();
      },
    );
  }

  void _showAddAmountWindow() {}

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
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
            ),
            itemCount: amounts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => widget.onSelected(amounts[index]),
                child: GridTile(
                  child: Center(
                    child: Text(
                      '${amounts[index]} ml',
                      style: AppTextStyle.h3,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: _showAddAmountWindow,
                    icon: const Icon(
                      Icons.add,
                      color: AppColors.greyLight,
                      size: 25,
                    ),
                  ),
                  const Text(
                    'Add amount',
                    style: TextStyle(color: AppColors.greyLight),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: _showCustomAmountWindow,
                    icon: const Icon(
                      Icons.tune,
                      color: AppColors.greyLight,
                      size: 25,
                    ),
                  ),
                  const Text(
                    'Custom amount',
                    style: TextStyle(color: AppColors.greyLight),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
