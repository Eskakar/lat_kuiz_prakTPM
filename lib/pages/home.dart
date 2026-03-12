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
    {"nama": "Nasi Goreng", "harga": 15000, "gambar": "assets/image/nasi_goreng.jpg"},
    {"nama": "Mie Ayam", "harga": 12000, "gambar": "assets/image/mie_ayam.jpg"},
    {"nama": "Bakso", "harga": 16000, "gambar": "assets/image/bakso.jpg"},
    {"nama": "Sate Ayam", "harga": 15000, "gambar": "assets/image/sate_ayam.jpg"},
    {"nama": "Lotek", "harga": 12000, "gambar": "assets/image/lotek.jpg"},
    {"nama": "Gado-gado", "harga": 14000, "gambar": "assets/image/gado_gado.jpg"},
  ];

  void orderMenu(item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          nama: item["nama"],
          harga: item["harga"],
          gambar: item["gambar"],
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
        title: Text( 
          "KANTiN VETERAN",
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold 
          ), 
        ), 
        backgroundColor: const Color.fromARGB(255, 3, 95, 6), 
        actions: [ 
          IconButton( 
            onPressed: logout, 
            icon: Icon(Icons.logout), 
            color: Colors.white, 
          ) 
        ], 
      ),

      body: Column(
        children: [
          // Banner
          Image.network(
            "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (context, index) {
                var item = menu[index];

                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: GestureDetector(
                    onTap: () => orderMenu(item),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          // Gambar makanan (opsional)
                          
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item["gambar"],
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          

                          const SizedBox(width: 10),

                          // Nama dan harga
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["nama"],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  "Rp${item["harga"]}",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Tombol pesan
                          ElevatedButton(
                            onPressed: () => orderMenu(item),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 244, 255, 210),
                              foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            ),
                            child: const Text("Pesan"),
                          ),
                        ],
                      ),
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
