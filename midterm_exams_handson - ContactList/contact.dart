import 'package:flutter/material.dart';

class Contact extends StatefulWidget{
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                      }
                  ),
                ),
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('res/image.png'),
              ),
              SizedBox(height: 15),
              Text('Chrissandra Bautista', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('+63 976 456 2314', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(255, 47, 157, 49),
                        child: Icon(Icons.call, color: Colors.white),
                     ),
                     SizedBox(width: 5,),
                     CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(255, 224, 210, 65),
                        child: Icon(Icons.message, color: Colors.white),
                     ),
                    ]
                  ),
                  
                ],
              ),
              SizedBox(height: 20),
              _buildCallHistory(),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildCallHistory(){
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Call history', style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 193, 193, 193))),
        ],),
        SizedBox(height: 15),
        _buildReceivedCall('Apr 27, 14:16', '+639654367513', 'Didn\'t connect'),
        SizedBox(height: 10),
        _buildMissedCall('Apr 20, 10:35', '+639654367513', 'Rang 5 times'),
         SizedBox(height: 10),
        _buildReceivedCall('Mar 05, 19:23', '+639654367513', 'Outgoing 15 min 12 sec'),
         SizedBox(height: 10),
        _buildReceivedCall('Feb 12, 08:03', '+639654367513', 'Incoming 30 sec'),
      ],
    )
  );
}

Widget _buildReceivedCall(String dateTime, String number, String def){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(dateTime, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Row(
            children: [
              Row(
                children: [
                  Text(number, style: TextStyle(fontSize: 10)),
                  Icon(Icons.call_made, size: 10),
                ],
              )
            ],
          )
        ],
      ),
      Text(def, style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 184, 184, 184))),
    ],
  );
}

Widget _buildMissedCall(String dateTime, String number, String def){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(dateTime, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red)),
          Row(
            children: [
              Row(
                children: [
                  Text(number, style: TextStyle(fontSize: 10, color: Colors.red)),
                  Icon(Icons.call_received, size: 10, color: Colors.red),
                ],
              )
            ],
          )
        ],
      ),
      Text(def, style: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 184, 184, 184))),
    ],
  );
}

}