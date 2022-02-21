import 'package:test_bloc_projekt/feature/domain/entities/person_entit.dart';

class PersonModel extends PersonEntity {
  PersonModel({
    required int id,
    required String name,
    required String status,
    required String spaies,
    required String type,
    required String gender,
    required LoctaionEntity origin,
    required LoctaionEntity loction,
    required String image,
    required List<String> episode,
    required DateTime created,
  }) : super(
          id: id,
          name: name,
          status: status,
          spaies: spaies,
          type: type,
          gender: gender,
          origin: origin,
          loction: loction,
          image: image,
          episode: episode,
          created: created,
        );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      spaies: json['spaies'],
      type: json['type'],
      gender: json['gender'],
      origin: json['origin']['name'],
      loction: json['loction']['name'],
      image: json['image'],
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      created: DateTime.parse(json['created']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'spaies': spaies,
      'type': type,
      'gender': gender,
      'origin': origin,
      'loction': loction,
      'image': image,
      'episode': episode,
      'created': created.toIso8601String(),
    };
  }
}
