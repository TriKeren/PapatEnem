import 'dart:convert'; // Untuk decode JSON
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:papat_enem/widget/popup_banner.dart';

void main() {
  runApp(KasirPage());
}

class KasirPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CardKasir(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CardKasir extends StatefulWidget {
  @override
  _CardKasirState createState() => _CardKasirState();
}

class _CardKasirState extends State<CardKasir> {
  List<dynamic> imagesData = [];

  // Fungsi untuk membaca dan decode JSON
  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/json/images.json');
    final jsonData = jsonDecode(jsonString);
    setState(() {
      imagesData = jsonData['images'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData(); // Load data JSON saat aplikasi dimulai
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Kasir',
          style: TextStyle(
            color: Color(0xff050522),
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Icon(
            Icons.arrow_back,
            color: Color(0xff050522),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
            child: imagesData.isNotEmpty
                ? GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: imagesData.length, // Jumlah card sesuai data JSON
                    itemBuilder: (context, index) {
                      final imageData = imagesData[index];
                      return GestureDetector(
                        onTap: () {
                          showBannerDialog(context, imageData['title']);
                        },
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch, // Agar gambar memenuhi lebar card
                            children: [
                              // Gambar di atas
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0), // Hanya bagian atas yang rounded
                                ),
                                child: Image.asset(
                                  imageData['path'], // Mengambil gambar dari JSON
                                  height: 120, // Atur tinggi gambar sesuai kebutuhan
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Title di bawah gambar
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      imageData['title'], // Mengambil title dari JSON
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff050522),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 4), // Spasi antara title dan price
                                    Text(
                                      'Rp ${imageData['price']}', // Mengambil price dari JSON
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()), // Tampilkan loader saat data belum di-load
          ),
          // Tombol keranjang di pojok kanan bawah
          Positioned(
            bottom: 15,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color(0xff050522), // Warna latar belakang biru
              child: const Icon(Icons.shopping_cart, color: Colors.white), // Ikon keranjang
            ),
          ),
        ],
      ),
    );
  }
}
