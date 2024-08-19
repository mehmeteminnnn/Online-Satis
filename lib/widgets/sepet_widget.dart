import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SepetWidget extends StatefulWidget {
  const SepetWidget({super.key});

  @override
  State<SepetWidget> createState() => _SepetWidgetState();
}

class _SepetWidgetState extends State<SepetWidget> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    print(user.uid);
    final userDoc =
        FirebaseFirestore.instance.collection("kullanicilar").doc(user.uid);

    return StreamBuilder<DocumentSnapshot>(
      stream: userDoc.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Yükleniyor animasyonu
        }

        if (snapshot.hasError) {
          return Text("Bir hata oluştu: ${snapshot.error}"); // Hata mesajı
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Text("Veri bulunamadı"); // Veri bulunamadı mesajı
        }

        final List sepetListesi = snapshot.data!['sepettekiler'] ?? [];

        return Stack(
          children: [
            Positioned(
              right: -2,
              top: -3,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  sepetListesi.length.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              iconSize: 30,
              color: Colors.black,
              onPressed: () {
                print("Shopping button clicked");
              },
            ),
          ],
        );
      },
    );
  }
}
