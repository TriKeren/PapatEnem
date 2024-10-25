import 'package:flutter/material.dart';
import 'package:papat_enem/pages/kasir_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KasirPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CartProvider with ChangeNotifier {
  int _itemCount = 0;

  int get itemCount => _itemCount;

  void addItem() {
    _itemCount++;
    notifyListeners();
  }
}