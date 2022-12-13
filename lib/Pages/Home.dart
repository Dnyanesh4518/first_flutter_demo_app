import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['IsDayTime'] ? 'sunnyday.jpg' : 'nightseen.jpeg';
    Color bgColor = data['IsDayTime'] ? Colors.black : Colors.white;
    Color barColor = data['IsDayTime'] ? Colors.blue : Colors.black45;
    return Scaffold(
        backgroundColor: barColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                child: Column(
                  children: <Widget>[
                    TextButton.icon(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white),
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/choose');
                          setState(() {
                            data = {
                              'location': result['location'],
                              'flag': result['flag'],
                              'time': result['time'],
                              'IsDayTime': result['IsDayTime']
                            };
                          });
                        },
                        icon: Icon(Icons.edit_location),
                        label: Text(
                          'Edit Location',
                          style: TextStyle(backgroundColor: null),
                        )),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['location'],
                          style: TextStyle(
                              color: bgColor,
                              fontSize: 28.0,
                              fontFamily: 'Times New Roman',
                              letterSpacing: 2.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      data['time'],
                      style: TextStyle(
                          color: bgColor,
                          fontFamily: 'Times New Roman',
                          fontSize: 40.0),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
