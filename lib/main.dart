import 'package:clean_architecture/core/databases/cache/cache_helper.dart';
import 'package:clean_architecture/features/user/presentation/cubit/user_cubit.dart';
import 'package:clean_architecture/features/user/presentation/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()..eitherFailureOrUser(1)),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: UserScreen()),
    ),
  );
}
