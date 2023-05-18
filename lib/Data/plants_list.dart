import 'package:hive_flutter/hive_flutter.dart';
import 'package:watermyplants/features/home_page/models/home_plant_model.dart';

class PlantsList {
  // final Box<HomePlantModel> box = Hive.box('plants');
  static List<HomePlantModel> plantsList =
      List<HomePlantModel>.empty(growable: true);

  static void getData() {
    Box<HomePlantModel> box = Hive.box('plants');
    if (box.values.isNotEmpty) {
      plantsList = box.values
          .map(
            (e) => HomePlantModel(
              id: e.id,
              name: e.name,
              description: e.description,
              location: e.location,
            ),
          )
          .toList();
      print(plantsList);
    }
  }

  static void addData(HomePlantModel data) {
    final Box<HomePlantModel> box = Hive.box('plants');
    PlantsList.plantsList.add(data);
    print('plant added to list');
    box.add(data);
    print('plant added in storage');
  }

  static void deleteData(HomePlantModel data) {
    final Box<HomePlantModel> box = Hive.box('plants');
    var keys = box.keys.toList();
    for (var key in keys) {
      HomePlantModel? plant = box.get(key);
      if (plant!.id == data.id) {
        box.delete(key);
        print('deleted');
      }
    }
    PlantsList.plantsList.remove(data);
  }
}
