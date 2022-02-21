import 'package:test_bloc_projekt/feature/domain/entities/person_entit.dart';

abstract class PerosnReopsitory {
  Future<List<PersonEntity>> getAllPersons(int page);
  Future<List<PersonEntity>> serchPersons(String query);
}
