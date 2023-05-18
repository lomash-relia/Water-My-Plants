import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watermyplants/features/home_page/Bloc/home_bloc.dart';
import 'package:watermyplants/features/home_page/models/HomePlantModel.dart';

class AddPlantPage extends StatelessWidget {
  AddPlantPage({Key? key, required this.homeBloc}) : super(key: key);

  final Box<HomePlantModel> box = Hive.box('plants');

  final HomeBloc homeBloc;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  TimeOfDay? selectedTime = TimeOfDay.now();

  handlePlant() {
    if (_formKey.currentState!.validate()) {
      HomePlantModel newPlant = HomePlantModel(
          name: _titleController.text,
          description: _descriptionController.text,
          location: _locationController.text);
      if (selectedTime != null) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 1,
            channelKey: 'basic_channel',
            category: NotificationCategory.Reminder,
            title: 'Water your plants!',
            body: 'It\'s time to water your plants.',
          ),
          schedule: NotificationCalendar(
              hour: selectedTime!.hour,
              minute: selectedTime!.minute,
              repeats: true),
        );
      }
      box.add(newPlant);
      print('plant added in storage');
      homeBloc.add(HomeAddPlantEvent(newPlant: newPlant));
    }
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                      ElevatedButton(
                        onPressed: handlePlant,
                        child: const Text('Submit Plant'),
                      ),
                    ]),
              ],
            ),
          )),
    );
  }
}
