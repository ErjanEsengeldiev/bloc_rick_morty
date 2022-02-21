import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_bloc_projekt/core/eror/exeption.dart';
import 'package:test_bloc_projekt/feature/data/models/person_model.dart';

abstract class PersonLocalDataSource {
  Future<List<PersonModel>> getListPersonFromCache();
  Future<void> personsToCache(List<PersonModel> persons);
}

const cahedPersonsList = 'CACHED_PERSONS_LIST';

class PersonLocalDatatSourceImpl implements PersonLocalDataSource {
  final SharedPreferences sharedPreferences;

  PersonLocalDatatSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PersonModel>> getListPersonFromCache() {
    final jsonPersonsList = sharedPreferences.getStringList(cahedPersonsList);
    if (jsonPersonsList?.isNotEmpty ?? false) {
      return Future.value(
        jsonPersonsList!
            .map((person) => PersonModel.fromJson(
                  json.decode(person),
                ))
            .toList(),
      );
    } else {
      throw CacheExeption();
    }
  }

  @override
  Future<void> personsToCache(List<PersonModel> persons) {
    final List<String> jsonPersonList =
        persons.map((person) => json.encode(person.toJson())).toList();
    sharedPreferences.setStringList(cahedPersonsList, jsonPersonList);
// ignore: void_checks
    return Future.value(jsonPersonList);
  }
}
