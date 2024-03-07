abstract class CounterState {}

//This is innitial state of bloc
class CounterInitial extends CounterState {
  late final int value;
  CounterInitial(this.value);
}

//This is the loading state of bloc
class CounterPageLoading extends CounterState {}

//This is the success state of bloc
class CounterPageLoaded extends CounterState {}

//This is the error state of bloc
class CounterPageError extends CounterState {
  late final String errorMessage;
  CounterPageError(this.errorMessage);
}

class CounterIncrease extends CounterState {
  late final int value;
  CounterIncrease(this.value);
}
