import 'package:flutter/material.dart';
import 'package:latihan_kuiz/pages/login.dart';
import 'package:latihan_kuiz/pages/order.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List menu = [
    {"nama": "Nasi Goreng", "harga": 15000},
    {"nama": "Mie Ayam", "harga": 12000},
    {"nama": "Bakso", "harga": 13000},
    {"nama": "Sate Ayam", "harga": 20000},
  ];

  void orderMenu(item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          nama: item["nama"],
          harga: item["harga"],
        ),
      ),
    );
  }

  void logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Menu"),
        actions: [
          IconButton(
            onPressed: logout,
            icon: Icon(Icons.logout),
          )
        ],
      ),

      body: Column(
        children: [

          // Banner
          Image.network(
            "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (context, index) {

                var item = menu[index];

                return Card(
                  child: ListTile(
                    title: Text(item["nama"]),
                    subtitle: Text("Rp ${item["harga"]}"),
                    trailing: ElevatedButton(
                      child: Text("Pesan"),
                      onPressed: () => orderMenu(item),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
