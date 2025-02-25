import 'package:flutter/material.dart';
import 'personal_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes debug banner
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profileHeader(),
            Builder(
              builder: (context) => _menuList(context), // ✅ Fixed context issue
            ),
            _buildHelpSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _profileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/SDS.png'), // ✅ Fixed asset loading
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rign3',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'Aggressive Programmer',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuList(BuildContext context) {
    const double padding = 5;
    return Column(
      children: [
        _menuItem(Icons.person, "Personal Data", () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalData()));
        }),
        SizedBox(height: padding),
        _menuItem(Icons.settings, "Settings", () {}),
        SizedBox(height: padding),
        _menuItem(Icons.description, "E-Statement", () {}),
        SizedBox(height: padding),
        _menuItem(Icons.favorite, "Referral Code", () {}),
        SizedBox(height: padding * 2),
        Divider(thickness: 1, indent: 10, endIndent: 20, color: Colors.grey),
        SizedBox(height: padding * 2),
        _menuItem(Icons.help, "FAQs", () {}),
        SizedBox(height: padding),
        _menuItem(Icons.book, "Our Handbook", () {}),
        SizedBox(height: padding),
        _menuItem(Icons.group, "Community", () {}),
      ],
    );
  }

  Widget _menuItem(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5), // ✅ Fixed padding
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(26, 255, 255, 255),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: TextStyle(color: Colors.black)),
          trailing: Icon(Icons.arrow_right, color: Colors.black),
          onTap: onTap, // ✅ Fixed missing parameter
        ),
      ),
    );
  }

  Widget _buildHelpSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.headset_mic, color: Colors.black),
            SizedBox(width: 8),
            Text(
              'Feel Free to Ask, We\'re Ready to Help',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}
