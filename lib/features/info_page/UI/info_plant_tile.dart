import 'package:flutter/material.dart';
import 'package:watermyplants/features/info_page/models/plants_model.dart';
import 'package:transparent_image/transparent_image.dart';

class PlantListTile extends StatelessWidget {
  final PlantObject plant;
  TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  row(String content) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(content, style: textStyle),
      ),
    ]);
  }

  PlantListTile({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${plant.id}. ${plant.commonName}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FadeInImage.memoryNetwork(
              height: 300,
              placeholder: kTransparentImage,
              image: plant.defaultImage.originalUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Table(
              border:
                  const TableBorder(horizontalInside: BorderSide(width: 2.0)),
              children: [
                row('Scientific name: ${plant.scientificName.join(', ')}'),
                row('Other names: ${plant.otherName.join(',\n')}'),
                row('Growth cycle: ${plant.cycle}'),
                row('Watering: ${plant.watering}'),
                row('Sunlight: ${plant.sunlight.join(', ')}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
