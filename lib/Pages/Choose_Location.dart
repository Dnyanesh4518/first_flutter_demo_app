import 'package:first_flutter_demo_app/services/World_Time.dart';
import 'package:flutter/material.dart';

class Choose_Location extends StatefulWidget {
  const Choose_Location({Key? key}) : super(key: key);

  @override
  State<Choose_Location> createState() => _Choose_LocationState();
}

class _Choose_LocationState extends State<Choose_Location> {
  List<WorldTime> locations = [
    WorldTime(Location: "Abidjan", Flag: "Abidjan.png", URL1: "Africa/Abidjan"),
    WorldTime(Location: "Accra", Flag: "Accra.png", URL1: "Africa/Accra"),
    WorldTime(Location: "Algiers", Flag: "Algiers.png", URL1: "Africa/Algiers"),
    WorldTime(Location: "Bissau", Flag: "Bissau.png", URL1: "Africa/Bissau"),
    WorldTime(Location: "Cairo", Flag: "Cairo.png", URL1: "Africa/Cairo"),
    WorldTime(
        Location: "Casablanca",
        Flag: "Casablanca.png",
        URL1: "Africa/Casablanca"),
    WorldTime(Location: "Ceuta", Flag: "Ceuta.png", URL1: "Africa/Ceuta"),
    WorldTime(
        Location: "El_Aaiun", Flag: "El_Aaiun.png", URL1: "Africa/El_Aaiun"),
    WorldTime(
        Location: "Johannesburg",
        Flag: "Johannesburg.png",
        URL1: "Africa/Johannesburg"),
    WorldTime(
        Location: "Asuncion", Flag: "Asuncion.png", URL1: "America/Asuncion"),
    WorldTime(
        Location: "Atikokan", Flag: "Atikokan.png", URL1: "America/Atikokan"),
    WorldTime(Location: "Bahia", Flag: "Bahia.png", URL1: "America/Bahia"),
    WorldTime(
        Location: "Jamaica", Flag: "Jamaica.png", URL1: "America/Jamaica"),
    WorldTime(
        Location: "Mexico_City",
        Flag: "Mexico_City.png",
        URL1: "America/Mexico_City"),
    WorldTime(Location: "Panama", Flag: "Panama.png", URL1: "America/Panama"),
    WorldTime(Location: "Baghdad", Flag: "Baghdad.png", URL1: "Asia/Baghdad"),
    WorldTime(Location: "Colombo", Flag: "Colombo.jpeg", URL1: "Asia/Colombo"),
    WorldTime(Location: "Dhaka", Flag: "Dhaka.png", URL1: "Asia/Dhaka"),
    WorldTime(Location: "Dubai", Flag: "Dubai.png", URL1: "Asia/Dubai"),
    WorldTime(
        Location: "Hong_Kong", Flag: "Hong_Kong.png", URL1: "Asia/Hong_Kong"),
    WorldTime(Location: "Kabul", Flag: "Kabul.jpeg", URL1: "Asia/Kabul"),
    WorldTime(Location: "Karachi", Flag: "Karachi.png", URL1: "Asia/Karachi"),
    WorldTime(Location: "Kolkata", Flag: "Kolkata.png", URL1: "Asia/Kolkata"),
    WorldTime(
        Location: "Kathmandu", Flag: "Kathmandu.png", URL1: "Asia/Kathmandu"),
    WorldTime(Location: "Qatar", Flag: "Qatar.png", URL1: "Asia/Qatar"),
    WorldTime(
        Location: "Singapore", Flag: "Singapore.png", URL1: "Asia/Singapore"),
    WorldTime(Location: "Tehran", Flag: "Tehran.png", URL1: "Asia/Tehran"),
    WorldTime(Location: "Tokyo", Flag: "Tokyo.png", URL1: "Asia/Tokyo"),
    WorldTime(
        Location: "Bermuda", Flag: "Bermuda.png", URL1: "Atlantic/Bermuda"),
    WorldTime(
        Location: "Brisbane", Flag: "Brisbane.png", URL1: "Australia/Brisbane"),
    WorldTime(
        Location: "Adelaide", Flag: "Adelaide.png", URL1: "Australia/Adelaide"),
    WorldTime(
        Location: "Melbourne",
        Flag: "Melbourne.png",
        URL1: "Australia/Melbourne"),
    WorldTime(Location: "Perth", Flag: "Perth.png", URL1: "Australia/Perth"),
    WorldTime(Location: "Sydney", Flag: "Sydney.png", URL1: "Australia/Sydney"),
    WorldTime(Location: "Berlin", Flag: "Berlin.png", URL1: "Europe/Berlin"),
    WorldTime(
        Location: "Budapest", Flag: "Budapest.png", URL1: "Europe/Budapest"),
    WorldTime(Location: "London", Flag: "London.png", URL1: "Europe/London"),
    WorldTime(Location: "Moscow", Flag: "Moscow.png", URL1: "Europe/Moscow"),
    WorldTime(Location: "Paris", Flag: "Paris.png", URL1: "Europe/Paris")
  ];
  void UpdateTime(index) async {
    WorldTime instance = locations[index];

    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.Location,
      'flag': instance.Flag,
      'time': instance.Time,
      'IsDayTime': instance.IsDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                  child: ListTile(
                onTap: () {
                  UpdateTime(index);
                },
                title: Text(locations[index].Location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].Flag}'),
                ),
              )),
            );
          }),
    );
  }
}
