import 'package:test_bloc_projekt/feature/domain/entities/person_entit.dart';
import 'package:test_bloc_projekt/feature/domain/repository/person_repository.dart';

class SerchPersons {
  final PerosnReopsitory perosnReopsitory;
  SerchPersons({required this.perosnReopsitory});
  Future<List<PersonEntity>> call(String query) async {
    return perosnReopsitory.serchPersons(query);
  }
}
