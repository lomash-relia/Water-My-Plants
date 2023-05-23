import 'package:flutter/material.dart';
import 'package:watermyplants/Data/plants_http_service.dart';
import 'package:watermyplants/features/info_page/UI/info_plant_tile.dart';
import 'package:watermyplants/features/info_page/models/plants_model.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final HttpService httpService = HttpService();
  List<PlantObject> plantObjects = List.empty(growable: true);
  static int pageNumber = 1;
  static const apiKey = '';

  handleObject() async {
    var response = await httpService
        .fetchPlantsData('species-list?page=$pageNumber&key=$apiKey');

    response['data'].forEach((plant) {
      plantObjects = plantObjectFromMap(response['data']);
    });
    setState(() {});
  }

  @override
  void initState() {
    handleObject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Encyclopedia'),
        actions: [
          IconButton(
              onPressed: () {
                if (pageNumber != 1) {
                  pageNumber--;
                  setState(() {
                    handleObject();
                  });
                }
              },
              icon: const Icon(Icons.navigate_before_rounded)),
          IconButton(
              onPressed: () {
                pageNumber++;
                setState(() {
                  handleObject();
                });
              },
              icon: const Icon(Icons.navigate_next_rounded)),
        ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.5,
              image: AssetImage('assets/images/plant_background.png'),
              fit: BoxFit.cover),
        ),
        child: ListView.builder(
          itemCount: plantObjects.length,
          itemBuilder: (context, index) {
            return PlantListTile(plant: plantObjects[index]);
          },
        ),
      ),
    );
  }
}
