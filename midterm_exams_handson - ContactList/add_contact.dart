import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContact> {
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  String fname = "";
  String lname = "";
  String number = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Text('First Name', style: TextStyle(fontSize: 18)),
            buildTextField("Enter first name", _fnameController),
            SizedBox(height: 5),
            Text('Last Name', style: TextStyle(fontSize: 18)),
            buildTextField("Enter last name", _lnameController),
            SizedBox(height: 5),
            Text('Phone Number', style: TextStyle(fontSize: 18)),
            buildTextField("+63 9__ ___ ____", _numberController),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController Controller){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: Controller,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      )
      );
  }
}
