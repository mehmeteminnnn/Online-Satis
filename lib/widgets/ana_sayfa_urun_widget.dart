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
                Image.network(
                  widget.urun.resimYolu,
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
                SizedBox(width: 8),
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
    );
  }
}
