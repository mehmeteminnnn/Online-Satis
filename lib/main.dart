import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

DateTime hedef_zaman = DateTime(2024, 12, 29, 12);
Duration kalan_zaman = hedef_zaman.difference(DateTime.now());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: "Ara...",
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10.5, 0),
                    child: SizedBox(
                      width: 257.8,
                      child: Text(
                        'Categories',
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
                      'View All ->',
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
                  for (int i = 0; i < 10; i++)
                    Column(
                      children: [
                        Image(
                          image: AssetImage('assets/Vector.png'),
                          width: 45,
                          height: 45,
                        ),
                        Text("Moda"),
                      ],
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
                          'Deal of the day',
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
                        'View All ->',
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
          ],
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
