import 'package:hive/hive.dart';

part 'HomePlantModel.g.dart';

@HiveType(typeId: 0)
class HomePlantModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String location;

  HomePlantModel(
      {required this.name, required this.description, required this.location});
}
