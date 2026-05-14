import 'package:burc_uygulamasi/data/strings.dart';
import 'package:burc_uygulamasi/model/burc.dart';
import 'package:burc_uygulamasi/zodiac_card_widget.dart';
import 'package:burc_uygulamasi/burc_detay.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatefulWidget {
  const BurcListesi({super.key});

  @override
  State<BurcListesi> createState() => _BurcListesiState();
}

class _BurcListesiState extends State<BurcListesi> {
  late List<Burc> tumBurclar;
  late List<Burc> filtrelenmisler;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    tumBurclar = veriKaynaginiHazirla();
    filtrelenmisler = tumBurclar;
    _searchController = TextEditingController();
    _searchController.addListener(_filtrele);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filtrele() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filtrelenmisler = tumBurclar;
      } else {
        filtrelenmisler = tumBurclar
            .where((burc) => burc.burcAdi.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Burç Rehberi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Burç ara...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: filtrelenmisler.isEmpty
                ? Center(
                    child: Text('Burç bulunamadı'),
                  )
                : GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: filtrelenmisler.length,
                    itemBuilder: (context, index) {
                      final burc = filtrelenmisler[index];
                      return ZodiacCard(
                        burcAdi: burc.burcAdi,
                        burcTarihi: burc.burcTarihi,
                        resim: 'images/${burc.burcKucukResim}',
                        colorKey: burc.colorKey,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BurcDetay(
                                secilenBurc: burc,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < Strings.BURC_ADLARI.length; i++) {
      var burcAdi = Strings.BURC_ADLARI_GORUNEN[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetayi = Strings.BURC_GENEL_OZELLIKLERI[i];
      var colorKey = Strings.BURC_RENK_KEYLERI[i];

      var burcKucukResim =
          ("${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png");
      var burcBuyukResim =
          ("${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png");

      Burc eklenecekBurc = Burc(
        burcAdi,
        burcTarihi,
        burcDetayi,
        burcKucukResim,
        burcBuyukResim,
        colorKey,
      );
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
