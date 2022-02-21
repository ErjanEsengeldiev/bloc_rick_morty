import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc_projekt/core/eror/exeption.dart';
import 'package:test_bloc_projekt/feature/domain/entities/person_entit.dart';
import 'package:test_bloc_projekt/feature/domain/use_cases/serch_person.dart';

part 'person_bloc_event.dart';
part 'person_bloc_state.dart';

class PersonSerchBlocBloc extends Bloc<SerchEvent, PersonSerchState> {
  final SerchPersons serchPersons;

  PersonSerchBlocBloc({required this.serchPersons}) : super(PersonEmptyState()) {
    on<PersonSerchEvent>((event, emit) async {
      emit(PersonSerchLoadingState());
      try {
        emit(PersonSerchLoadedState(
            persons: await serchPersons.perosnReopsitory
                .serchPersons(event.personQuery)));
      } catch (e) {
        throw PersonSerchErorState(message: 'Eror Fetching Users');
      }
    });
  }
}
