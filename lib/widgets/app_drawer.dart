import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: const Color.fromARGB(255, 181, 115, 91),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: const Color.fromARGB(255, 181, 115, 91)),
            accountName: Text('Mehmet Emin'),
            accountEmail: Text('mehmetemin@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://fikirturu.com/storage/2024/03/260520231-scaled-1-696x464.jpg"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Home sayfasına gitmek için kod buraya
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Ayarlar sayfasına gitmek için kod buraya
            },
          ),
          Divider(color: Colors.white70),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.white),
            title: Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Scaffold.of(context).closeDrawer();
              // Çıkış yapmak için kod buraya
            },
          ),
        ],
      ),
    );
  }
}
