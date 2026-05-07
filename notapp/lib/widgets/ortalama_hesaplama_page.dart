import 'package:flutter/material.dart';
import 'package:notapp/constants/app_constants.dart';
import 'package:notapp/helper/data_helper.dart';
import 'package:notapp/model/ders.dart';
import 'package:notapp/widgets/ortalama_goster.dart';

class OrtalamaHesaplamaPage extends StatefulWidget {
  const OrtalamaHesaplamaPage({super.key});

  @override
  State<OrtalamaHesaplamaPage> createState() => OrtalamaHesaplamaPageState();
}

class OrtalamaHesaplamaPageState extends State<OrtalamaHesaplamaPage> {
  var  formkey = GlobalKey<FormState>(); // formun gecerli olup olmadigini kontrol etmek ve formdaki textFormFieldlerin girdigi degerleri almak icin kullanilir, formkeynin tipi GlobalKey<FormState> olmalidir cunku bu sayede formun gecerli olup olmadigini kontrol edebiliriz ve formdaki textFormFieldlerin girdigi degerleri alabiliriz
  double secilendeger = 4; // DropdownButtonun secilen degerini tutar, bu degerin tipi double olmalidir cunku DropdownMenuItemlerin value degeri double tipindedir
  int krediDegeri = 1; // DropdownButtonun secilen degerini tutar, bu degerin tipi int olmalidir cunku DropdownMenuItemlerin value degeri int tipindedir
  String girilenDersAdi = ""; // TextFormFieldin girdigi degeri tutar, bu degerin tipi String olmalidir cunku TextFormFieldin onSaved fonksiyonu String tipinde bir deger alir
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:  Center(child: Text(Sabitler.baslikText, style: TextStyle(color: Colors.white , fontSize: 25, fontWeight: FontWeight.bold  ),)),
      ), //AppBar

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Columnun icindeki widgetlarin genisligini ekrana yaymak icin kullanilir
        children: [
          SizedBox(height: 5,), // SizedBox, widgetlar arasina bosluk eklemek icin kullanilir
          Row(
            children: [
              Expanded(
                flex: 2, // Expanded widgeti, Rowun geri kalan alanini kaplamasini saglar, flex degeri ise bu alanin ne kadar kaplanacagini belirler
                child: _buildForm(),
              ),
          Expanded(// Expanded widgeti, Columnun geri kalan alanini kaplamasini saglar
            flex: 1,
            child: OrtalamaGoster(ortalama: DataHelper.ortalamaHesapla(), dersSayisi: DataHelper.tumEklenenDersler.length), // OrtalamaGoster widgeti, ortalama ve ders sayisi bilgilerini gosterir, bu bilgileri parametre olarak alir
          ),
  ],
          ),


          Expanded(child: Container(
            color:  const Color.fromARGB(255, 196, 213, 214),
            child: ListView.separated(
              itemCount: DataHelper.tumEklenenDersler.length, // ders sayisi
              separatorBuilder: (context, index) => Divider(
                color: Sabitler.anaRenk, // bölmecinin rengi
                thickness: 1.5, // bölmecinin kalınlığı
              ), // her eleman arasina bölmeci ekler
              itemBuilder: (context, index){ // contex -> konum. index -> o anki elemanin index
                var oAnkiDers = DataHelper.tumEklenenDersler[index]; 
                return _buildListTile(oAnkiDers); // _buildListTile fonksiyonu, o anki dersin bilgilerini gosterir, bu fonksiyonun parametresi oAnkiDers degiskenidir
              },
            ),
          ),)
        ],
      )
    );
  }
  
  Widget _buildForm() {
    return Form(
      key : formkey,
      child: Column(
        children: [
          _buildTextFormField(),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildHarfler(),
              _buildKrediler(),
              IconButton(onPressed: _dersEkleVeOrtalamaHesapla, 
              icon: Icon(Icons.arrow_forward_ios_sharp)),
            ],
          )
        ],
      ),
      );
  }
  
  // ignore: strict_top_level_inference
  _buildTextFormField() {

    return TextFormField(
      
      decoration: InputDecoration(
        hintText: "Ders Adını Giriniz",
        border: OutlineInputBorder(borderRadius: Sabitler.borderRadius),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100,
        
      ),
      onSaved: (deger){
        setState(() {
          girilenDersAdi = deger!; // TextFormFieldin onSaved fonksiyonu, kullanici texti girdikten sonra bu texti alir ve girilenDersAdi degiskenine atar, setState fonksiyonu ise bu degisiklikten sonra widgetin yeniden cizilmesini saglar
        });
      },
      validator: (s){
        if(s!.isEmpty){ // textFormFieldin validator fonksiyonu, kullanici texti girdikten sonra bu texti kontrol eder, eger text bos ise hata mesajini gosterir
          return "Ders adını giriniz";
        } else {
          return null;
        }
      },
     );
     
  }
  
  Container _buildHarfler() {
      
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100,
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton(
        value: secilendeger,
        onChanged: (deger){
          setState(() {
            secilendeger = deger!.toDouble(); // DropdownButtonun onChanged fonksiyonu, secilen degeri alir ve bu degeri secilendeger degiskenine atar, setState fonksiyonu ise bu degisiklikten sonra widgetin yeniden cizilmesini saglar
          });
        },
        items:[
          DropdownMenuItem(child: Text("AA"), value: 4),
          DropdownMenuItem(child: Text("BA"), value: 3.5),
          DropdownMenuItem(child: Text("BB"), value: 3),
          DropdownMenuItem(child: Text("CB"), value: 2.5),
          DropdownMenuItem(child: Text("CC"), value: 2),
          DropdownMenuItem(child: Text("DC"), value: 1.5),
          DropdownMenuItem(child: Text("DD"), value: 1),
          DropdownMenuItem(child: Text("FF"), value: 0),
        ]
        
        ),
    );
  }
  
  Container _buildKrediler() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100,
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton(
        value: krediDegeri,
        onChanged: (deger){
          setState(() {
            krediDegeri = deger!;
          });
        },
        items:[
          DropdownMenuItem(value: 1, child: Text("1")),
          DropdownMenuItem(value: 2, child: Text("2")),
          DropdownMenuItem(value: 3, child: Text("3")),
          DropdownMenuItem(value: 4, child: Text("4")),
          DropdownMenuItem(value: 5, child: Text("5")),
          DropdownMenuItem(value: 6, child: Text("6")),
          DropdownMenuItem(value: 7, child: Text("7")),
          DropdownMenuItem(value: 8, child: Text("8")),
        ]
        
        ),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {

    if(formkey.currentState!.validate()){ // formkeynin currentStateinin validate fonksiyonu, formun gecerli olup olmadigini kontrol eder, eger form gecerliyse true degerini dondurur
     formkey.currentState!.save(); // formkeynin currentStateinin save fonksiyonu, formun onSaved fonksiyonunu cagirir, bu sayede formdaki textFormFieldlerin onSaved fonksiyonlari cagrilir ve bu fonksiyonlarda textFormFieldlerin girdigi degerler alinir
     formkey.currentState!.reset(); // formkeynin currentStateinin reset fonksiyonu, formu resetler, bu sayede formdaki textFormFieldlerin girdigi degerler temizlenir ve form tekrar bos hale gelir
     var eklenecekDers = Ders(
      ad: girilenDersAdi, 
      harfDegeri: secilendeger,
      krediDegeri: krediDegeri);
      
      DataHelper.dersEkle(eklenecekDers); // DataHelper sinifinin dersEkle fonksiyonu, eklenen dersi tumEklenenDersler listesine ekler, bu sayede eklenen dersler tutulur ve daha sonra ortalama hesaplama islemi yapilir
       // Ders sinifindan bir nesne olusturulur, bu nesnenin ad, harfDegeri ve krediDegeri ozellikleri formdan alinan degerlerle doldurulur
      print("Ortalama: ${DataHelper.ortalamaHesapla()}"); // eklenen dersin bilgileri konsola yazdirilir
    }
  }

   ListTile _buildListTile(Ders oAnkiDers) {
    return ListTile(
      
      title: Text(oAnkiDers.ad , style: TextStyle(color: const Color.fromARGB(255, 2, 99, 18), fontSize: 20, fontWeight: FontWeight.bold), ),
      subtitle: Text("${oAnkiDers.krediDegeri} kredi, ${oAnkiDers.harfDegeri} not"), 
    );
  }
}
