import 'package:test_bloc_projekt/core/eror/exeption.dart';
import 'package:test_bloc_projekt/core/platform/network_info.dart';
import 'package:test_bloc_projekt/feature/data/data_sourses/person_local_data_source.dart';
import 'package:test_bloc_projekt/feature/data/data_sourses/person_remote_data_sours.dart';
import 'package:test_bloc_projekt/feature/data/models/person_model.dart';
import 'package:test_bloc_projekt/feature/domain/entities/person_entit.dart';
import 'package:test_bloc_projekt/feature/domain/repository/person_repository.dart';

class PersonRepositoryImpl implements PerosnReopsitory {
  final PersonRemoteDataSourses personRemoteDataSourses;
  final PersonLocalDataSource personLocalDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryImpl(
      {required this.personRemoteDataSourses,
      required this.personLocalDataSource,
      required this.networkInfo});
  @override
  Future<List<PersonEntity>> getAllPersons(int page) async {
    return _getPersons(personRemoteDataSourses.getAllPersons(page));
  }

  @override
  Future<List<PersonEntity>> serchPersons(String query) async {
    return _getPersons(personRemoteDataSourses.serchPersons(query));
  }

  Future<List<PersonModel>> _getPersons(
      Future<List<PersonModel>> getPersons) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await getPersons;
        personLocalDataSource.personsToCache(remotePerson);
        return remotePerson;
      } on ServerExeption {
        throw Exception('Internet Exeption');
      }
    } else {
      try {
        final locationPerson =
            await personLocalDataSource.getListPersonFromCache();
        return locationPerson;
      } on CacheExeption {
        throw Exception('Cache Exception');
      }
    }
  }
}
