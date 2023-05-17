import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watermyplants/features/home_page/Bloc/home_bloc.dart';
import 'package:watermyplants/features/home_page/models/HomePlantModel.dart';

class AddPlantPage extends StatelessWidget {
  AddPlantPage({Key? key, required this.homeBloc}) : super(key: key);

  Box<HomePlantModel> box = Hive.box('plants');
  final HomeBloc homeBloc;

  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add Plant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Plant Name'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                label: Text('Plant Description'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: locationController,
              decoration: const InputDecoration(
                label: Text('Location of Plant'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                HomePlantModel newPlant = HomePlantModel(
                    name: titleController.text,
                    description: descriptionController.text,
                    location: locationController.text);

                box.add(newPlant);
                print('--------plant added in storage ------');
                homeBloc.add(HomeAddPlantEvent(newPlant: newPlant));
              },
              child: const Text('SUBMIT PLANT'),
            ),
          ],
        )),
      ),
    );
  }
}
