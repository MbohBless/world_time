import 'package:flutter/material.dart';
import 'package:world_time/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading";
  void setUpWorldTime() async {
    WorldTime instance = WorldTime("Europe/Berlin","Berlin", "germany.png" );
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home",arguments: {
      'location':instance.location,
      'flag':instance.flag,
      "time":instance.time,
      "isDayTime":instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80,
        ),
      )
    );
  }
}
