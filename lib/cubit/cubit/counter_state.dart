abstract class CounterAppState{}

final class CounterAppInitialState extends CounterAppState{}

final class CounterAppIncrementState extends CounterAppState{
  final int number;
  CounterAppIncrementState({required this.number});
}