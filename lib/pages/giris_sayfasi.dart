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
  var yukleniyor1 = false;
  var email = "";
  var sifre = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giriş Sayfası")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration:
                  const InputDecoration(hintText: "E-mail adresini gir"),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => email = value,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(hintText: "Şifreni gir"),
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => sifre = value,
              obscureText: true,
            ),
            SizedBox(height: 10),
            if (yukleniyor1)
              CircularProgressIndicator()
            else
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 14, 190, 87),
                    minimumSize: Size(100, 50)),
                onPressed: () {
                  if (email.isNotEmpty && sifre.isNotEmpty) yukleniyor = true;
                  setState(() {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email, password: sifre);
                  });
                },
                child: Text("Giriş Yap"),
              ),
            SizedBox(height: 10),
            if (yukleniyor)
              CircularProgressIndicator()
            else
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 14, 190, 87),
                    minimumSize: Size(100, 50)),
                onPressed: () {
                  if (yukleniyor1 = true)
                    CircularProgressIndicator();
                  else yukleniyor1 = true;
                    setState(() {
                      FirebaseAuth.instance.signInAnonymously();
                    });
                },
                child: Text("Anonim Giriş Yap"),
              ),
          ],
        ),
      ),
    );
  }
}
