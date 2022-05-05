import 'package:flutter/material.dart';
import 'package:genshin_api/genshin_api.dart' show Talent;
import 'package:sizer/sizer.dart';

class SkillList extends StatelessWidget {
  final List<Talent> skills;

  const SkillList({Key? key, required this.skills}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: skills.length,
      itemBuilder: (context, i) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Text(
                skills[i].name,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                skills[i].unlock,
                style: Theme.of(context).textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
              const Divider(
                thickness: 1,
              ),
              Text(
                skills[i].description,
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
