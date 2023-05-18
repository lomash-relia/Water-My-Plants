import 'package:flutter/material.dart';
import 'package:watermyplants/features/home_page/Bloc/home_bloc.dart';
import 'package:watermyplants/features/home_page/models/HomePlantModel.dart';

class PlantTile extends StatelessWidget {
  const PlantTile(
      {Key? key, required this.homeBloc, required this.homePlantModel})
      : super(key: key);

  final HomeBloc homeBloc;

  final HomePlantModel homePlantModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14.0, left: 14.0, top: 14.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              homePlantModel.name,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
              width: double.maxFinite,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text(
                    homePlantModel.location,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    homePlantModel.description,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ]),
                IconButton(
                    onPressed: () {
                      homeBloc
                          .add(HomeDeletePlantEvent(newPlant: homePlantModel));
                    },
                    icon: const Icon(Icons.delete_forever_outlined))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
