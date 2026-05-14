import 'package:burc_uygulamasi/model/burc.dart';
import 'package:flutter/material.dart';

class BurcDetay extends StatelessWidget {
  final Burc secilenBurc;
  const BurcDetay({super.key, required this.secilenBurc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(secilenBurc.burcAdi, style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/${secilenBurc.burcBuyukResim}"),
                SizedBox(height: 12),
                Text(secilenBurc.burcAdi, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                SizedBox(height: 6),
                Text(secilenBurc.burcTarihi, style: TextStyle(fontSize: 18, color: Colors.grey, fontFamily: 'Arial'),),
                SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.pinkAccent, width: 1),
                  ),
                  child: Text(secilenBurc.burcDetayi, style: TextStyle(fontSize: 16), textAlign: TextAlign.center)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}