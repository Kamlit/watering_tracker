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
        backgroundColor: AppColors.backgroundColor,
        child: Column(
          children: [
            ProfileContainer(user: FirebaseAuth.instance.currentUser),
          ],
        ),
      ),
    );
  }
}
