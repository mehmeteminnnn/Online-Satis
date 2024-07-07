import 'package:flutter/material.dart';
import 'package:online_satis/widgets/ana_sayfa_urun_widget.dart';

void main() {
  runApp(MyApp());
}

DateTime hedef_zaman = DateTime(2024, 12, 29, 12);
Duration kalan_zaman = hedef_zaman.difference(DateTime.now());
List<String> kategoriler = [
  "FashionCart",
  "AppliancesCart",
  "BeautyCart",
  "ElectronicCart",
  "FurnitureCart",
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        drawer: Drawer(),
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
                child: Row(
                  children: [
                    for (int i = 0; i < kategoriler.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage('assets/${kategoriler[i]}.png'),
                            ),
                            Text(
                                "${kategoriler[i].substring(0, kategoriler[i].length - 4)}"),
                          ],
                        ),
                      )
                  ],
                ),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 2),
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
                                  "Upto 40% OFF",
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
                            Text("Ürün Adı"),
                            Text("Ürün Fiyatı"),
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
                            Text("Ürün Adı"),
                            Text("Ürün Fiyatı"),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Image.asset('assets/Wrist.png'),
                            Text("Ürün Adı"),
                            Text("Ürün Fiyatı"),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnaSayfaUrunWidget(
                        baslik: "Nike",
                        fiyat: 50,
                        favoriMi: false,
                        resimYolu: "assets/Nike1.png",
                        indirimOrani: 50),
                    AnaSayfaUrunWidget(
                        baslik: "Nike",
                        fiyat: 50,
                        favoriMi: false,
                        resimYolu: "assets/NikeSky2.png",
                        indirimOrani: 50),
                    AnaSayfaUrunWidget(
                        baslik: "Nike",
                        fiyat: 50,
                        favoriMi: false,
                        resimYolu: "assets/Adidas1.png",
                        indirimOrani: 50),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*Widget myApp=MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ana Sayfa"),
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
        drawer: Drawer(),
      ),
    );*/
