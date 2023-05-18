import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watermyplants/features/home_page/Bloc/home_bloc.dart';
import 'package:watermyplants/features/home_page/models/home_plant_model.dart';
import 'package:uuid/uuid.dart';

class AddPlantPage extends StatelessWidget {
  AddPlantPage({Key? key, required this.homeBloc}) : super(key: key);

  final HomeBloc homeBloc;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  TimeOfDay? selectedTime = TimeOfDay.now();

  Future<void> handlePlant() async {
    if (_formKey.currentState!.validate()) {
      var plantId = const Uuid().v1();
      HomePlantModel newPlant = HomePlantModel(
          id: plantId,
          name: _titleController.text,
          description: _descriptionController.text,
          location: _locationController.text);
      homeBloc.add(
          HomeAddPlantEvent(newPlant: newPlant, selectedTime: selectedTime));
    }
  }

  Future<void> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    //Uint8List imageBytes = await image.readAsBytes();
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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _titleController,
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
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _descriptionController,
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
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _locationController,
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
                const SizedBox(
                  height: 15,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: pickImage,
                          icon: const Icon(Icons.camera_alt_rounded)),
                      ElevatedButton(
                        onPressed: () async {
                          selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            initialEntryMode: TimePickerEntryMode.input,
                          );
                        },
                        child: const Text('Set Reminder to Water'),
                      ),
                    ]),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: handlePlant,
                  child: const Text('Submit Plant'),
                ),
              ],
            ),
          )),
    );
  }
}
