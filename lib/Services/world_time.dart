import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  late String time;
  String flag;
  String url;
   bool? isDayTime;

  WorldTime( this.url,this.location, this.flag);

 Future< void >getTime() async{
    Response response= await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);
    String dateTime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);
//print(name);
    DateTime now=DateTime.parse(dateTime);
    now=now.add(Duration(hours: int.parse(offset)));
    //set the time property
   isDayTime=now.hour>6&&now.hour<20 ? true: false;
    time=DateFormat.jm().format(now);
  }
}