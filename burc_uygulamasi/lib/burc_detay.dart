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
                    // ignore: deprecated_member_use
                    color: Colors.pink.shade50.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color.fromARGB(255, 195, 94, 128), width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent.withValues(alpha: 0.22),
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: const Offset(0, 10),
                      ),
                    ],

                  ),
                  child: Text(secilenBurc.burcDetayi, style: TextStyle(fontSize: 16 , height: 1.5), textAlign: TextAlign.center,)),
              ],


            ),
          ),
        ),
      ),
    );
  }
}