import 'package:flutter/material.dart';
import 'package:genshin_api/genshin_api.dart' show Constellation;
import 'package:sizer/sizer.dart';

class ConstellationList extends StatelessWidget {
  final List<Constellation> constellations;

  const ConstellationList({Key? key, required this.constellations})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: constellations.length,
      itemBuilder: (context, i) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Text(
                constellations[i].name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                constellations[i].unlock,
                style: Theme.of(context).textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
              const Divider(
                thickness: 1,
              ),
              Text(
                constellations[i].description,
                textAlign: TextAlign.center,
              )
            ]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 1.h);
      },
    );
  }
}
