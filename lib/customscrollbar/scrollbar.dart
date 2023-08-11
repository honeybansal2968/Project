import 'package:demo/customscrollbar/constants.dart';
import 'package:demo/customscrollbar/model.dart';
import 'package:flutter/material.dart';

class CustomScrollBar extends StatelessWidget {
  const CustomScrollBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Athlete> athletes = jsonData
        .map((data) => Athlete(name: data["name"]!, level: data["level"]!))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Athletes by Level'),
      ),
      body: AthletesList(athletes: athletes),
    );
  }
}

class AthletesList extends StatelessWidget {
  final List<Athlete> athletes;

  const AthletesList({super.key, required this.athletes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount:
          3, // Assuming we have three levels: Basic, Intermediate, and Advanced
      itemBuilder: (context, levelIndex) {
        final level = ["Basic", "Intermediate", "Advanced"][levelIndex];
        final athletesByLevel =
            athletes.where((athlete) => athlete.level == level).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              level,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: athletesByLevel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(athletesByLevel[index].name),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
