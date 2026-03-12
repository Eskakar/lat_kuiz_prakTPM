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

  int jumlah = 1;

  int get total => jumlah * widget.harga;

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

            Text("Harga: Rp ${widget.harga}"),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (jumlah > 1) jumlah--;
                    });
                  },
                ),

                Text(
                  "$jumlah",
                  style: TextStyle(fontSize: 20),
                ),

                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      jumlah++;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 20),

            Text(
              "Total Harga: Rp $total",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}