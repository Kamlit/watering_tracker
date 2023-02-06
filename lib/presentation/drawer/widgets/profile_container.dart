import 'package:drink_tracker/logic/blocs/authentication_bloc.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({required this.user, super.key});
 
  final User? user;
  
  void _signOut(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(
      SignOutRequested(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: AppColors.dark,
      height: 150,
      child: Row(
        children: [
          const Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 60,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user!.displayName.toString(),
                style: AppTextStyle.h2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(user!.email.toString(), style: AppTextStyle.h3),
              TextButton(
                onPressed: () => _signOut(context),
                child: const Text('Logout'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
