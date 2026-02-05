import 'package:clean_architecture/core/di/di.dart';
import 'package:clean_architecture/features/user/presentation/cubit/user_cubit.dart';
import 'package:clean_architecture/features/user/presentation/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  init();

  runApp(
    BlocProvider(
      create: (_) => sl<UserCubit>()..getUserById(1),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: UserScreen()),
    ),
  );
}
