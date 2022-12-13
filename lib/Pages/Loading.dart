import 'package:flutter/material.dart';
import 'package:first_flutter_demo_app/services/World_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        Location: 'Kolkata', Flag: 'Kolkata.png', URL1: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.Location,
      'flag': instance.Flag,
      'time': instance.Time,
      'IsDayTime': instance.IsDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent[400],
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 90.0, 0, 150.0),
                child: Center(
                  child: Center(
                    child: SpinKitHourGlass(
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ),
              ),
              Text(
                'Loading....',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ]));
  }
}
