import 'package:burc_uygulamasi/burc_detay.dart';
import 'package:burc_uygulamasi/model/burc.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({super.key, required this.listelenenBurc});

  @override
  Widget build(BuildContext context) {
    return BurcDetay(secilenBurc: listelenenBurc);
  }
}
