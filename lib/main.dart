import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_project/cubit/cubit/counter_cubit.dart';
import 'package:new_flutter_project/cubit/cubit/counter_state.dart';
import 'package:new_flutter_project/cubit/cubit/fetch_user_cubit.dart';
import 'package:new_flutter_project/screens/counter_screen.dart';
import 'package:new_flutter_project/screens/fetch_data_screen.dart';
import 'package:new_flutter_project/repo/fetch_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FetchUserCubit(FetchUserRepo()),),
          BlocProvider(create: (context) => CounterIncrementCubit(CounterAppInitialState()),)
        ],
        child:  CounterScreen(),
      ),
    );
  }
}
