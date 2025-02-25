import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  _personalDataState createState() => _personalDataState();
}

class _personalDataState extends State<PersonalData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _incomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('Personal Data'),
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('assets/SDS.png'),
                  )
                ],
              )
            )
          ]
        )
      )
    );
  }
  
  
}