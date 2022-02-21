import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_bloc_projekt/feature/domain/entities/person_entit.dart';
import 'package:test_bloc_projekt/feature/domain/use_cases/get_all_persons.dart';
part 'persons_list_bloc_event.dart';
part 'persons_list_bloc_state.dart';

class PersonsListBlocBloc
    extends Bloc<PersonsListBlocEvent, PersonsListBlocState> {
  final GetAllPersons getAllPersons;
  PersonsListBlocBloc({required this.getAllPersons})
      : super(PersonsEmtyState()) {
    on<PersonsListBlocEvent>((event, emit) async {
      int page = 1;
      if (state is PersonsLoadingState) return;

      var oldPersons = <PersonEntity>[];
      if (state is PersonsLoadedeState) {
        oldPersons = (state as PersonsLoadedeState).personsList;
      }
      emit(PersonsLoadingState(oldPersons, isFirstFetch: page == 1));

      try {
        final personsList = await getAllPersons.call(page);
        emit(
          PersonsLoadedeState(personsList: personsList),
        );
      } catch (e) {
        throw Exception('Eror Ftching Users');
      }
    });
  }
}
