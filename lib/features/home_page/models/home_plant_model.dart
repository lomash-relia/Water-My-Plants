import 'package:hive/hive.dart';

part 'home_plant_model.g.dart';

@HiveType(typeId: 0)
class HomePlantModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String location;
  @HiveField(3)
  final String? id;

  HomePlantModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.location});
}
