import 'package:drink_tracker/presentation/routing/router.dart';
import 'package:drink_tracker/presentation/routing/routes.dart';
import 'package:drink_tracker/presentation/drawer/widgets/drawer_tile.dart';
import 'package:drink_tracker/presentation/drawer/widgets/profile_container.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.all,
        ),
        backgroundColor: AppColors.backgroundColor,
        child: Column(
          children: [
            ProfileContainer(
              user: FirebaseAuth.instance.currentUser,
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  // DrawerTile(
                  //   icon: Icons.home,
                  //   title: 'Diary',
                  //   onTap: () {},
                  // ),
                  DrawerTile(
                    icon: Icons.bar_chart,
                    title: 'Statistics',
                    onTap: () {},
                  ),
                  DrawerTile(
                    icon: Icons.adjust,
                    title: 'Goal',
                    onTap: () {},
                  ),
                  DrawerTile(
                    icon: Icons.bookmark,
                    title: 'Saved values',
                    onTap: () {
                      Scaffold.of(context).closeDrawer();
                      Navigator.of(context).pushNamed(Routes.savedValuesScreen);
                    },
                  ),
                  DrawerTile(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {},
                  ),
                  DrawerTile(
                    icon: Icons.info,
                    title: 'About',
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
