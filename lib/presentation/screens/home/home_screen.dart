import 'package:drink_tracker/presentation/drawer/app_drawer.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/add_button.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/details_bottom_container.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/mililitres_progress.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/semi_circular_progress_bar.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/transparent_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      backgroundColor: AppColors.backgroundColor,
      drawer: const AppDrawer(),
      appBar: const TransparentAppBar(
        height: 80,
      ),
      body: Column(
        children: const [
          Expanded(
            flex: 6,
            child: MililitresProgress(),
          ),
          Expanded(
            flex: 3,
            child: AddButton(),
          ),
          Expanded(
            flex: 3,
            child: SemiCircularProgressBar(
              size: 32,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DetailsBottomContainer(),
        ],
      ),
    );
  }
}
