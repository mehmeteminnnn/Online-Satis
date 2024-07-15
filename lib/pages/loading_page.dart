import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_satis/pages/giris_sayfasi.dart';
import 'package:online_satis/pages/home_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final girisyaptimi = snapshot.hasData && snapshot.data != null;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: girisyaptimi ? AnaSayfa() : GirisSayfasi(),
          );
        });
  }
}
