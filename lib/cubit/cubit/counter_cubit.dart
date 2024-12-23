import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_project/cubit/cubit/counter_state.dart';

class CounterIncrementCubit extends Cubit<CounterAppState>{
  CounterIncrementCubit(super.initialState);
  void incrementNumber({ required int number }){
    emit(CounterAppIncrementState(number:number+1));
  }
}