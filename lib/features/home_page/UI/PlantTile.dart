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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
//          Image.network();
          Text(
            homePlantModel.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
            width: double.maxFinite,
          ),
          Text(
            homePlantModel.location,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            homePlantModel.description,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
