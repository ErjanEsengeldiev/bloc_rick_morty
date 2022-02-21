part of 'persons_list_bloc_bloc.dart';

@immutable
abstract class PersonsListBlocState {}

class PersonsLoadingState extends PersonsListBlocState {
  final List<PersonEntity> oldPersonsList;
  final bool isFirstFetch;

  PersonsLoadingState(this.oldPersonsList, {this.isFirstFetch = false});
}

class PersonsLoadedeState extends PersonsListBlocState {
  final List<PersonEntity> personsList;
  PersonsLoadedeState({required this.personsList});
}

class PersonsEmtyState extends PersonsListBlocState {}

class PersonsErorState extends PersonsListBlocState {
  final String message;
  PersonsErorState({required this.message});
}
