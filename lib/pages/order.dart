import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String nama;
  final int harga;
  final String gambar;
  const OrderPage({super.key,required this.nama, required this.harga, required this.gambar});


  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _jumlah = TextEditingController();
  int totalHarga = 0;

  void hitungTotal() {
    int jumlah = int.tryParse(_jumlah.text) ?? 0;
    setState(() {
      totalHarga = jumlah * widget.harga;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.nama,
          style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.green,
        ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            //gambar
            Image.asset(
              widget.gambar,
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),

            //deskirpsi makanan
            Text(
              widget.nama,
              style: TextStyle(fontSize: 22),
            ),

            Text("Harga: Rp${widget.harga}"),

            SizedBox(height: 20),

            TextField(
              controller: _jumlah,
              decoration: InputDecoration(
                hint: Text("Masukkan jumlah"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                )
              ),
            ),

            SizedBox(height: 20),
            //tombol pesan
            ElevatedButton(
              onPressed: hitungTotal,
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 110, 226, 15),
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                minimumSize: Size(200, 60), 
              ),
              child: Text("Pesan"),
            ),
            SizedBox(height: 20),
            //
            Text(
              "Total Harga: Rp$totalHarga",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}