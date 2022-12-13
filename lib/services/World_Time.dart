import 'package:first_flutter_demo_app/services/World_Time.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String Location;
  late String Time;
  late String Flag;
  late String URL1;
  late bool IsDayTime;

  WorldTime({required this.Location, required this.Flag, required this.URL1});
  Future<void> getTime() async {
    try {
      var url = Uri.parse("http://worldtimeapi.org/api/timezone/$URL1");
      var response = await get(url);
      Map data = jsonDecode(response.body);
      // get properties from data
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'];
      String hours = offset.substring(0, 3);
      String time = offset.substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now =
          now.add(Duration(hours: int.parse(hours), minutes: int.parse(time)));

      IsDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      Time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      Time = 'Error occured';
    }
  }
}
