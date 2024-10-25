import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<String> _cartItems = []; // Ganti dengan model produk Anda

  int get itemCount => _cartItems.length;

  void addItem(String item) {
    _cartItems.add(item); // Tambahkan item ke keranjang
    notifyListeners(); // Beritahu pendengar bahwa ada perubahan
  }
}
