import 'package:hive_flutter/hive_flutter.dart';
import 'package:watermyplants/features/home_page/models/HomePlantModel.dart';

class PlantsList {
  static List<HomePlantModel> plantsList =
      List<HomePlantModel>.empty(growable: true);

  static void getData() {
    Box<HomePlantModel> box = Hive.box('plants');
    plantsList = box.values
        .map((e) => HomePlantModel(
              name: e.name,
              description: e.description,
              location: e.location,
            ))
        .toList();
    print(plantsList);
  }
}
