import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_satis/models/urun_model.dart';
import 'package:online_satis/widgets/ana_sayfa_urun_widget.dart';
import 'package:online_satis/widgets/app_drawer.dart';
import 'package:online_satis/widgets/kategori_widget.dart';

DateTime hedef_zaman = DateTime(2024, 12, 29, 12);
Duration kalan_zaman = hedef_zaman.difference(DateTime.now());

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ana Sayfa",
          style: TextStyle(fontFamily: "Inter"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none_outlined),
            onPressed: () {
              print("Search button clicked");
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              print("More button clicked");
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: "Ara...",
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10.5, 0),
                    child: SizedBox(
                      width: 257.8,
                      child: Text(
                        'Kategoriler',
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 1.5,
                          letterSpacing: 0.1,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 1.5, 0, 1.5),
                    child: Text(
                      'Hepsini Gör ->',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 1.5,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("kategoriler")
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      final categoryList =
                          snapshot.data!.docs.map((e) => e.data()).toList();
                      return Row(
                        children: [
                          const SizedBox(width: 6),
                          for (final data in categoryList)
                            CategoryWidget(
                              title: data['adı'],
                              imageUrl: data['resimUrl'],
                            ),
                          const SizedBox(width: 4)
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 410,
              height: 154,
              child: PageView(
                children: [
                  Image(
                    image: AssetImage('assets/Banner.png'),
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: AssetImage('assets/Slider2.jpg'),
                    fit: BoxFit.cover,
                  ),
                  Image(
                      image: AssetImage('assets/banner2.png'),
                      fit: BoxFit.cover),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              child: SizedBox(
                width: 410,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: SizedBox(
                        width: 257.8,
                        child: Text(
                          'Günün Fırsatları',
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 1.5,
                            letterSpacing: 0.1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      margin: EdgeInsets.fromLTRB(0, 1.5, 0, 1.5),
                      child: Text(
                        'Hepsini Gör ->',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 239, 68, 68),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        " ${kalan_zaman.inHours % 24} HRS ${kalan_zaman.inMinutes % 60} MIN ${kalan_zaman.inSeconds % 60} SEC",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/Running.png'),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Yürüyüş Ayakkabısı"),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 239, 68, 68),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                " 40% İndirim",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Image.asset('assets/Sneakers.png'),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Sneakers"),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.greenAccent,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                " 4200 TL",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/Speaker.png'),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Hoparlör"),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.greenAccent),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                " 2300 TL",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Image.asset('assets/Wrist.png'),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Saat"),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 239, 68, 68),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                " %70'e Varan İndirim",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: SizedBox(
                    width: 257.8,
                    child: Text(
                      'En Çok Satan Ayakkabılar',
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 12.5,
                        height: 1.5,
                        letterSpacing: 0.1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  margin: EdgeInsets.fromLTRB(0, 1.5, 0, 1.5),
                  child: Text(
                    'Hepsini Gör ->',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 1.5,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            FutureBuilder(
                future: FirebaseFirestore.instance.collection("urunler").get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final urunler = snapshot.data!.docs
                        .map((e) => UrunModel.fromFirestore(e.data(), e.id))
                        .toList();

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (final urun in urunler)
                            AnaSayfaUrunWidget(urun: urun)
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0, // Seçili olan tabı belirtir
        onTap: (index) {
          // Tab değiştirildiğinde yapılacak işlemler
          print("Selected Tab: $index");
        },
      ),
    );
  }
}
