import 'package:flutter/material.dart';

void showBannerDialog(BuildContext context, String title) {
  final TextEditingController lengthController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent, // Mengatur background dialog transparan
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff050522),
            borderRadius: BorderRadius.circular(20.0), // Radius background dialog
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: lengthController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  hintText: "Contoh: 200 cm",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 15.0,
                      ),
                      textStyle: const TextStyle(fontSize: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text('Batal'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String inputLength = lengthController.text;
                      print('Panjang banner: $inputLength');
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 15.0,
                      ),
                      textStyle: const TextStyle(fontSize: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text('Konfirmasi'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
