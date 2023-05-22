import 'package:flutter/material.dart';

import 'package:watermyplants/features/home_page/Bloc/home_bloc.dart';
import 'package:watermyplants/features/home_page/models/home_plant_model.dart';
import 'package:uuid/uuid.dart';

class AddPlantPage extends StatefulWidget {
  const AddPlantPage({Key? key, required this.homeBloc}) : super(key: key);

  final HomeBloc homeBloc;

  @override
  State<AddPlantPage> createState() => _AddPlantPageState();
}

class _AddPlantPageState extends State<AddPlantPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  late TimeOfDay? selectedTime;

  Widget emptyGap() {
    return const SizedBox(
      height: 16,
    );
  }

  Future<void> handlePlant() async {
    if (_formKey.currentState!.validate()) {
      var plantId = const Uuid().v1();
      HomePlantModel newPlant = HomePlantModel(
        id: plantId,
        name: _titleController.text,
        description: _descriptionController.text,
        location: _locationController.text,
      );
      widget.homeBloc.add(
          HomeAddPlantEvent(newPlant: newPlant, selectedTime: selectedTime));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add Plant'),
      ),
      body: Form(
          key: _formKey,
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  opacity: 0.4,
                  image: AssetImage('assets/images/plant_background.png'),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    controller: _titleController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('Plant Name'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  emptyGap(),
                  TextFormField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some description';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('Plant Description'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  emptyGap(),
                  TextFormField(
                    controller: _locationController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the location';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('Location of Plant'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  emptyGap(),
                  ElevatedButton(
                    onPressed: () async {
                      selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.input,
                      );
                    },
                    child: const Text('Schedule Watering'),
                  ),
                  emptyGap(),
                  ElevatedButton(
                    onPressed: () {
                      handlePlant();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Plant Added 🥳')));
                    },
                    child: const Text('Add Plant'),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
