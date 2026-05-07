import 'package:flutter/material.dart';
import 'package:notapp/constants/app_constants.dart';
import 'package:notapp/helper/data_helper.dart';
import 'package:notapp/model/ders.dart';
import 'package:notapp/widgets/ortalama_goster.dart';
import 'package:notapp/widgets/common/custom_card.dart';
import 'package:notapp/widgets/common/custom_button.dart';
import 'package:notapp/widgets/common/empty_state.dart';
import 'package:notapp/widgets/common/grade_chip.dart';

class OrtalamaHesaplamaPage extends StatefulWidget {
  const OrtalamaHesaplamaPage({super.key});

  @override
  State<OrtalamaHesaplamaPage> createState() => OrtalamaHesaplamaPageState();
}

class OrtalamaHesaplamaPageState extends State<OrtalamaHesaplamaPage> {
  var formkey = GlobalKey<FormState>();
  double secilendeger = 4;
  int krediDegeri = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Sabitler.baslikText),
      ),
      body: Column(
        children: [
          // Form ve Ortalama Alanı
          Padding(
            padding: EdgeInsets.all(Sabitler.paddingMedium),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                SizedBox(width: Sabitler.paddingMedium),
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                    ortalama: DataHelper.ortalamaHesapla(),
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                  ),
                ),
              ],
            ),
          ),

          // Ders Listesi
          Expanded(
            child: _buildDersList(),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Ders Adı Input
          _buildTextFormField(),
          SizedBox(height: Sabitler.paddingMedium),

          // Notlar ve Kredi
          Row(
            children: [
              Expanded(child: _buildHarfler()),
              SizedBox(width: Sabitler.paddingSmall),
              Expanded(child: _buildKrediler()),
            ],
          ),
          SizedBox(height: Sabitler.paddingMedium),

          // Ekle Butonu
          CustomButton(
            label: "EKLE",
            icon: Icons.add_circle_outline,
            onPressed: _dersEkleVeOrtalamaHesapla,
            backgroundColor: Sabitler.anaRenk,
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: Sabitler.dersAdiHint,
        prefixIcon: Icon(Icons.book),
      ),
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.isEmpty) {
          return Sabitler.dersAdiValidasyon;
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildHarfler() {
    return CustomCard(
      padding: EdgeInsets.symmetric(
        horizontal: Sabitler.paddingSmall,
        vertical: Sabitler.paddingSmall,
      ),
      child: DropdownButtonFormField<double>(
        value: secilendeger,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          labelText: "Not",
          labelStyle: TextStyle(fontSize: Sabitler.smallFontSize),
        ),
        onChanged: (deger) {
          setState(() {
            secilendeger = deger!;
          });
        },
        items: [
          DropdownMenuItem(child: Text("AA"), value: 4.0),
          DropdownMenuItem(child: Text("BA"), value: 3.5),
          DropdownMenuItem(child: Text("BB"), value: 3.0),
          DropdownMenuItem(child: Text("CB"), value: 2.5),
          DropdownMenuItem(child: Text("CC"), value: 2.0),
          DropdownMenuItem(child: Text("DC"), value: 1.5),
          DropdownMenuItem(child: Text("DD"), value: 1.0),
          DropdownMenuItem(child: Text("FF"), value: 0.0),
        ],
      ),
    );
  }

  Widget _buildKrediler() {
    return CustomCard(
      padding: EdgeInsets.symmetric(
        horizontal: Sabitler.paddingSmall,
        vertical: Sabitler.paddingSmall,
      ),
      child: DropdownButtonFormField<int>(
        value: krediDegeri,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          labelText: "Kredi",
          labelStyle: TextStyle(fontSize: Sabitler.smallFontSize),
        ),
        onChanged: (deger) {
          setState(() {
            krediDegeri = deger!;
          });
        },
        items: List.generate(
          8,
          (index) => DropdownMenuItem(
            value: index + 1,
            child: Text("${index + 1}"),
          ),
        ),
      ),
    );
  }

  Widget _buildDersList() {
    if (DataHelper.tumEklenenDersler.isEmpty) {
      return EmptyState(
        message: Sabitler.bosDersListesi,
        icon: Icons.class_,
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(Sabitler.paddingMedium),
      itemCount: DataHelper.tumEklenenDersler.length,
      itemBuilder: (context, index) {
        var oAnkiDers = DataHelper.tumEklenenDersler[index];
        return _buildDersCard(oAnkiDers, index);
      },
    );
  }

  Widget _buildDersCard(Ders ders, int index) {
    return Dismissible(
      key: Key(ders.ad + index.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          DataHelper.tumEklenenDersler.removeAt(index);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${ders.ad} silindi"),
            duration: Duration(seconds: 2),
          ),
        );
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: Sabitler.paddingMedium),
        decoration: BoxDecoration(
          color: Sabitler.notFF,
          borderRadius: Sabitler.borderRadius,
        ),
        child: Icon(Icons.delete, color: Sabitler.beyaz),
      ),
      child: CustomCard(
        backgroundColor: Sabitler.beyaz,
        padding: EdgeInsets.all(Sabitler.paddingMedium),
        margin: EdgeInsets.only(bottom: Sabitler.paddingSmall),
        borderColor: Sabitler.getNotRengi(ders.harfDegeri),
        child: Row(
          children: [
            // Renkli gösterge
            Container(
              width: 6,
              height: 60,
              decoration: BoxDecoration(
                color: Sabitler.getNotRengi(ders.harfDegeri),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            SizedBox(width: Sabitler.paddingMedium),

            // Ders bilgisi
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ders.ad,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.credit_card, size: 14, color: Color(0xFF999999)),
                      SizedBox(width: 4),
                      Text(
                        "${ders.krediDegeri} Kredi",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Not badge'i
            GradeChip(
              notDegeri: ders.harfDegeri,
              notAdi: _getNotAdi(ders.harfDegeri),
            ),
          ],
        ),
      ),
    );
  }

  String _getNotAdi(double notDegeri) {
    final notMap = {
      4.0: "AA",
      3.5: "BA",
      3.0: "BB",
      2.5: "CB",
      2.0: "CC",
      1.5: "DC",
      1.0: "DD",
      0.0: "FF",
    };
    return notMap[notDegeri] ?? "?";
  }

  void _dersEkleVeOrtalamaHesapla() {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      formkey.currentState!.reset();

      var eklenecekDers = Ders(
        ad: girilenDersAdi,
        harfDegeri: secilendeger,
        krediDegeri: krediDegeri,
      );

      setState(() {
        DataHelper.dersEkle(eklenecekDers);
      });

      // Feedback
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${girilenDersAdi} eklendi ✓"),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );

      print("Ortalama: ${DataHelper.ortalamaHesapla()}");
    }
  }
}
