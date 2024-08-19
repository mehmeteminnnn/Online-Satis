import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_satis/pages/home_page.dart';

class KayitSayfasi extends StatefulWidget {
  const KayitSayfasi({super.key});

  @override
  State<KayitSayfasi> createState() => _KayitSayfasiState();
}

class _KayitSayfasiState extends State<KayitSayfasi> {
  var yukleniyor = false;
  var isimsoyisim = "";
  var email = "";
  var sifre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kayıt Sayfası")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "Adını-soyadını gir"),
              keyboardType: TextInputType.name,
              onChanged: (value) => isimsoyisim = value,
            ),
            SizedBox(height: 10),
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
            if (yukleniyor)
              CircularProgressIndicator()
            else
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 14, 190, 87),
                  minimumSize: Size(100, 50),
                ),
                onPressed: () async {
                  if (email.isNotEmpty &&
                      sifre.isNotEmpty &&
                      isimsoyisim.isNotEmpty) {
                    setState(() {
                      yukleniyor = true;
                    });

                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: email, password: sifre);
                      final kullanici = {'ad': isimsoyisim, 'email': email};
                      await FirebaseFirestore.instance
                          .collection('kullanicilar')
                          .doc(userCredential.user!.uid)
                          .set(kullanici);

                      setState(() {
                        yukleniyor = false;
                      });

                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        yukleniyor = false;
                      });
                      // Hata mesajı gösterebilirsiniz
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.message ?? "Hata oluştu")),
                      );
                    }
                  }
                },
                child: Text(
                  "Kayıt Ol",
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
