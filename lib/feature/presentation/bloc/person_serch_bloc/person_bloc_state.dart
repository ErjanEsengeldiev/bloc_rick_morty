part of 'person_bloc_bloc.dart';

@immutable
abstract class PersonSerchState {}

class PersonEmptyState extends PersonSerchState {}

class PersonSerchLoadingState extends PersonSerchState {}

class PersonSerchLoadedState extends PersonSerchState {
  final List<PersonEntity> persons;
  PersonSerchLoadedState({required this.persons});
}

class PersonSerchErorState extends PersonSerchState {
  final String message;

  PersonSerchErorState({required this.message});
}
