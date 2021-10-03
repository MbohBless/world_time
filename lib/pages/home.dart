import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data={};
  @override

  Widget build(BuildContext context) {
   data= data.isNotEmpty ? data:ModalRoute.of(context)!.settings.arguments;
   print(data);
   //setackground
   String bgImage=data["isDayTime"]?  'day.jpg':'night.jpg';
    Color? bgColor=data["isDayTime"]?Colors.blue:Colors.blue[900];
    Color? txColor=data["isDayTime"]?Colors.black:Colors.white;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(child:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage("assets/$bgImage"),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                  onPressed: () async{
                   dynamic result= await Navigator.pushNamed(context, "/location");
                   setState(() {
                     data={
                       'time':result['time'],
                       'flag':result['flag'],
                       'location':result['location'],
                       'isDayTime':result['isDayTime']
                     };
                   });
                   },
                  icon: Icon(Icons.edit_location,
                  color: txColor,),
                  label: Text("Edit Location",
                  style: TextStyle(
                      color: txColor
                  ),)
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: TextStyle(
                      fontSize: 28,
                        letterSpacing:2,
                      color: txColor
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                data["time"],
                style: TextStyle(
                  fontSize: 66,
                    color: txColor
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
