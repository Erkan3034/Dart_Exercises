import 'package:burc_uygulamasi/burc_detay.dart';
import 'package:burc_uygulamasi/model/burc.dart';
import 'package:flutter/material.dart';

class BurcItem  extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({super.key, required this.listelenenBurc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          
          leading: Image.asset("images/${listelenenBurc.burcKucukResim}"),
          title: Text(listelenenBurc.burcAdi),
          subtitle: Text(listelenenBurc.burcTarihi),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BurcDetay(secilenBurc: listelenenBurc)));
          },
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pinkAccent,
          ),
          
        ),
      ),
    );
  }

}