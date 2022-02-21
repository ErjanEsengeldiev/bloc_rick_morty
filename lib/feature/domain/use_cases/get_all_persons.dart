import 'package:test_bloc_projekt/feature/domain/entities/person_entit.dart';
import 'package:test_bloc_projekt/feature/domain/repository/person_repository.dart';

class GetAllPersons {
  final PerosnReopsitory perosnReopsitory;
  GetAllPersons({required this.perosnReopsitory});
  Future<List<PersonEntity>> call(int page) async {
    return perosnReopsitory.getAllPersons(page);
  }
}

