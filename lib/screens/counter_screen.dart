
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_project/cubit/cubit/counter_cubit.dart';
import 'package:new_flutter_project/cubit/cubit/counter_state.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Scareen"),
      ),
      body: BlocBuilder<CounterIncrementCubit, CounterAppState>(
        builder: (context, state) {
          if(state is CounterAppIncrementState){
            num = state.number;
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  num.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
          }else if(state is CounterAppInitialState){
            return Center(
                child: Text(
                  num.toString(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              );
          }
          return const SizedBox.shrink() ;
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        BlocProvider.of<CounterIncrementCubit>(context).incrementNumber(number: num);
        log("This is number: $num");
      }),
    );
  }
}
