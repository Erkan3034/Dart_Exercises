import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil İstatistik Kartı"),
        backgroundColor: Colors.blueAccent,
      ),

      // Sağ alt köşeye mesaj butonu ekliyoruz
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Mesaj Kutusu Açılıyor...");
        },
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.message, color: Colors.black),
      ),


      body: Center(
        child: Container(
          // Ana Gövde: 300x200 boyutlarında gri kart
          width: 300,
          height: 200,

          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10), 
          ),

          padding: const EdgeInsets.all(12),
          // kartın içindeki column yapısı
          child: Column(
          
            children: [
              // --- ÜST BÖLÜM (Kullanıcı Bilgileri) ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sol taraf: 100x100 Mavi Yuvarlak Profil Alanı
                  Container(
                    width: 100,
                    height: 100,

                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage("https://erkanturgut.com/img/profile.png"), fit: BoxFit.cover),
                    ),


                  ),


                  const SizedBox(width: 15), // Profil ve metin arası boşluk
                  // Sağ taraf: Kullanıcı Adı ve Şehir
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Erkan",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),


                      ),
                      Text(
                        "İstanbul",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              const Spacer(), 
              
              // istatistikler
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildStatColumn("Takipçi", "125"), // column takipci
                  buildStatColumn("Takip", "125"),  // column takip
                  buildStatColumn("Gönderi", "12"), // column gönderi
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // İstatistik sütunları için yardımcı fonksiyon
  Widget buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}