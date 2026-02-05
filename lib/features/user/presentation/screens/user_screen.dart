import 'package:clean_architecture/features/user/presentation/cubit/user_cubit.dart';
import 'package:clean_architecture/features/user/presentation/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  double currentUserID = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is GetUserFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is GetUserSuccessful) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    alignment: .center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Clean Architecture',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // user name
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(state.userEntity.name),
                    subtitle: Text(state.userEntity.email),
                  ),

                  // get new user
                  Slider(
                    value: currentUserID,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    label: currentUserID.toInt().toString(),
                    onChanged: (value) {
                      setState(() {
                        currentUserID = value;
                      });
                    },
                  ),

                  ElevatedButton(
                    onPressed: () {
                      context.read<UserCubit>().getUserById(
                        currentUserID.toInt(),
                      );
                    },
                    child: Text('Get User'),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentUserID = 1;
                      });
                      context.read<UserCubit>().getUserById(1);
                    },
                    child: Text('Restart'),
                  ),
                ],
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
