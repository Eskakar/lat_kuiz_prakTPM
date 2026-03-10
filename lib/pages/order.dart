import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {

  final String nama;
  final int harga;
  const OrderPage({super.key,required this.nama, required this.harga});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  int jumlah = 1;

  int get total => jumlah * widget.harga;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Order Page")),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

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