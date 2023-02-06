import 'package:drink_tracker/logic/blocs/authentication_bloc.dart';
import 'package:drink_tracker/presentation/app_drawer.dart';
import 'package:drink_tracker/presentation/screens/home/semi_circular_progress_bar.dart';
import 'package:drink_tracker/presentation/screens/home/transparent_app_bar.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      backgroundColor: Color.fromARGB(255, 36, 36, 36),
      drawer: AppDrawer(user: FirebaseAuth.instance.currentUser),
      appBar: const TransparentAppBar(
        height: 80,
      ),
      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [
      //         Color.fromARGB(255, 36, 36, 36),
      //         Color.fromARGB(255, 56, 56, 56),
      //       ],
      //     ),
      //   ),
      //   child:
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1200 ml',
                    style: AppTextStyle.h1White,
                  ),
                  Text(
                    'Goal: 2000 ml',
                    style: AppTextStyle.h3,
                  ),
                  Text(
                    '800 ml left',
                    style: AppTextStyle.h3,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => {},
                  child: Icon(
                    Icons.add,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greyDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    minimumSize: Size(60, 60),
                    maximumSize: Size(60, 60),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: const SemiCircularProgressBar(
              size: 32,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
              color: AppColors.dark,
              // boxShadow: [
              //   BoxShadow(
              //     color: Color.fromARGB(255, 26, 26, 26),
              //     blurRadius: 18,
              //     spreadRadius: 20,
              //   )
              // ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                Text(
                  'Details',
                  style: AppTextStyle.h2,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          // Expanded(
          //   flex: 5,
          //   child: Container(
          //     width: 200,
          //     height: 50,
          //     color: Colors.white,
          //     child: CustomPaint(
          //       painter: SemicirclePaint(),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
