abstract class CounterEvent {}

class CounterFetchDataEvent extends CounterEvent {
  final String countryCode;
  final String CounterType;
  CounterFetchDataEvent(this.countryCode, this.CounterType);
}

class CounterIncreaceEvent extends CounterEvent {
  // final int value;
  // CounterIncreaceEvent(this.value);
}
