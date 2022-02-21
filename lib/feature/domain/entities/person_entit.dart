class PersonEntity {
  final int id;
  final String name;
  final String status;
  final String spaies;
  final String type;
  final String gender;
  final LoctaionEntity origin;
  final LoctaionEntity loction;
  final String image;
  final List<String> episode;
  final DateTime created;
  PersonEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.spaies,
    required this.type,
    required this.gender,
    required this.origin,
    required this.loction,
    required this.image,
    required this.episode,
    required this.created,
  });
}

class LoctaionEntity {
  String name;
  String url;
  LoctaionEntity({required this.name, required this.url});
}
