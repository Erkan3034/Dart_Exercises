class Burc {
  final String _burcAdi;
  final String _burcTarihi;
  final String _burcDetayi;
  final String _burcKucukResim;
  final String _burcBuyukResim;


  Burc( //constructor
      this._burcAdi,
      this._burcTarihi,
      this._burcDetayi,
      this._burcKucukResim,
      this._burcBuyukResim
  );

String get burcBuyukResim => this._burcBuyukResim;
String get burcKucukResim => this._burcKucukResim;
String get burcAdi => this._burcAdi;
String get burcTarihi => this._burcTarihi;
String get burcDetayi => this._burcDetayi;

  @override
  String toString() {
    return "$_burcAdi - $_burcBuyukResim";
  }
}
