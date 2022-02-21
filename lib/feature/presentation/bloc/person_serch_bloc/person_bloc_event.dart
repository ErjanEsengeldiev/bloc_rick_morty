part of 'person_bloc_bloc.dart';

@immutable
abstract class SerchEvent {}

class PersonSerchEvent extends SerchEvent {
  final String personQuery;

  PersonSerchEvent({required this.personQuery});
}
