import 'package:dio/dio.dart';
import 'package:test_bloc_projekt/core/eror/exeption.dart';
import 'package:test_bloc_projekt/feature/data/models/person_model.dart';

abstract class PersonRemoteDataSourses {
  Future<List<PersonModel>> getAllPersons(int page);
  Future<List<PersonModel>> serchPersons(String query);
}

class PersonRemoteDataSoursesIpls implements PersonRemoteDataSourses {
  @override
  Future<List<PersonModel>> getAllPersons(int page) async =>
      _getUsersFromUrl('https://rickandmortyapi.com/api/character/?page=$page');

  @override
  Future<List<PersonModel>> serchPersons(String query) async =>
      _getUsersFromUrl(
          'https://rickandmortyapi.com/api/character/?name=$query');
}

Future<List<PersonModel>> _getUsersFromUrl(String url) async {
  final Response response = await Dio().get(url);
  if (response.statusCode == 200) {
    final responseData = response.data;
    return (responseData['resaults'] as List)
        .map((personJson) => PersonModel.fromJson(personJson))
        .toList();
  } else {
    throw ServerExeption();
  }
}
