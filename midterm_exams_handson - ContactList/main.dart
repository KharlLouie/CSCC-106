import 'package:flutter/material.dart';
import 'contact.dart';
import 'add_contact.dart';

void main() {
  runApp(const ContactListApp());
}

class ContactListApp extends StatelessWidget {
  const ContactListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _buildContactCard('Chrissandra Bautista', '+63 976 456 2314',() {
              Navigator.push (context, MaterialPageRoute(builder: (context) => Contact()));
            }),
            _buildContactCard('Josh Nimo', '+63 990 412 5438', () {}),
            _buildContactCard('Shelou Asaria', '+63 976 456 5438' , () {}),
            _buildContactCard('Ace Advincula', '+63 921 000 2314', () {}),
            _buildContactCard('Crislyn Delgado', '+63 991 067 0314', () {}),
            _buildContactCard('Airene Tungol', '+63 921 740 2314', () {}),
            _buildContactCard('James Legado', '+63 901 097 333', () {}),
            _buildContactCard('Kharl Almonguerra', '+63 922 121 2314', () {}),
            _buildContactCard('Vince Carabuena', '+63 901 906 2314', () {}),
            _buildContactCard('Errol de Pedro', '+63 965 000 4230', () {}),
            _buildAddButton(() {
              Navigator.push (context, MaterialPageRoute(builder: (context) => AddContact()));
            }),
          ]
        )
      ),
    );
  }

Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        leading: Text('Contacts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        trailing: Icon(Icons.search),
      ),
    );
  }

Widget _buildContactCard(String name, String num, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(234, 234, 234, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                num,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
            ],
          ),
          
          Icon(Icons.call, color: Colors.green),
        ],
      ),
      onTap: onTap,
      )
    );
  }

Widget _buildAddButton(VoidCallback onPress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 99, 167, 255),
          borderRadius: BorderRadius.circular(12),
          
        ),
        child: IconButton(
          icon: Icon(Icons.add, size: 25),
          padding: const EdgeInsets.symmetric(horizontal: 170),
          onPressed: onPress,
        )
      ),
    );
  }

}
