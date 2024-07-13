import 'package:flutter/material.dart';

class AnaSayfaUrunWidget extends StatefulWidget {
  AnaSayfaUrunWidget(
      {super.key,
      required this.baslik,
      required this.fiyat,
      required this.favoriMi,
      required this.resimYolu,
      required this.indirimOrani});

  @override
  State<AnaSayfaUrunWidget> createState() => _AnaSayfaUrunWidgetState();
  final String baslik;
  final double fiyat;
  final bool favoriMi;
  final String resimYolu;
  final double indirimOrani;
}

// var baslik = "Adidas Ayakkabı";
// double fiyat = 200;
// bool favoriMi = false;
// String resimYolu = "assets/Adidas1.png";
// double indirimOrani = 0.2;

class _AnaSayfaUrunWidgetState extends State<AnaSayfaUrunWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 60,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.resimYolu,
                  fit: BoxFit.cover,
                  width: 150,
                ),
                Positioned(
                  top: 1,
                  right: 0,
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              widget.baslik,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '\$${widget.fiyat}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      '${widget.indirimOrani.toInt()}% İndirim',
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
    );
  }
}
