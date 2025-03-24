import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color.fromARGB(31, 191, 191, 191),
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('res/PASSPORT.jpg'),
              ),
              const SizedBox(height: 20),
              _buildInfoCard(Icons.person, 'Kharl Louie A. Almonguerra'),
              _buildInfoCard(Icons.calendar_today, 'February 17, 2004'),
              _buildInfoCard(Icons.phone, '+64 977-804-5420'),
              _buildEmailCard('almonguerrakharllouie@gmail.com'),
              SizedBox(height: 25,),
              _buildAddressCard(
                  'Prk. Katilingban, San Pablo, Tacurong City 9800'),
              const Spacer(),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.teal[700],
                  unselectedItemColor: Colors.grey,   
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                    BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
                    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
                    BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Icon(icon),
        ],
      ),
    );
  }

  Widget _buildEmailCard(String email) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.teal[700],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(email, style: const TextStyle(color: Colors.white)),
          const Icon(Icons.email, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildAddressCard(String address) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.teal[700],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color.fromARGB(255, 92, 169, 160),
            child: const Icon(Icons.location_on, color: Colors.white),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(address, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}