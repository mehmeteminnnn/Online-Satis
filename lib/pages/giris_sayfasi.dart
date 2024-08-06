import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  var yukleniyor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("Giriş Sayfası"),
          ),
          if (yukleniyor)
            CircularProgressIndicator()
          else
            TextButton(
              onPressed: () {
                yukleniyor = true;
                setState(() {
                  FirebaseAuth.instance.signInAnonymously();
                });
              },
              child: Text("Giriş Yap"),
            ),
        ],
      ),
    );
  }
}
