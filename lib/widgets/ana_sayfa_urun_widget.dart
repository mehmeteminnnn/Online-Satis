import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_satis/models/urun_model.dart';

class AnaSayfaUrunWidget extends StatefulWidget {
  AnaSayfaUrunWidget({
    super.key,
    required this.urun,
  });

  @override
  State<AnaSayfaUrunWidget> createState() => _AnaSayfaUrunWidgetState();
  final UrunModel urun;
}

class _AnaSayfaUrunWidgetState extends State<AnaSayfaUrunWidget> {
  bool favoriMi = false;
  bool sepetMi = false;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userDoc =
        FirebaseFirestore.instance.collection("kullanicilar").doc(user!.uid);

    return SizedBox(
      height: 180,
      child: Card(
        elevation: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.urun.resimYolu,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 80,
                  ),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: IconButton(
                      icon: favoriMi
                          ? Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_border, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          favoriMi = !favoriMi;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    left: -10,
                    top: -10,
                    child: StreamBuilder<DocumentSnapshot>(
                      stream: userDoc.snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }
                        final List sepetListesi =
                            snapshot.data!['sepettekiler'] ?? [];
                        final listedemi =
                            sepetListesi.contains(widget.urun.uid);

                        return IconButton(
                          icon: listedemi
                              ? Icon(Icons.shopping_bag, color: Colors.green)
                              : Icon(Icons.shopping_bag_outlined,
                                  color: Colors.green),
                          onPressed: () {
                            if (listedemi) {
                              userDoc.update({
                                "sepettekiler":
                                    FieldValue.arrayRemove([widget.urun.uid])
                              });
                            } else {
                              userDoc.update({
                                "sepettekiler":
                                    FieldValue.arrayUnion([widget.urun.uid])
                              });
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                widget.urun.baslik,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '\$${widget.urun.fiyat}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        '${widget.urun.indirimOrani}% İndirim',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
