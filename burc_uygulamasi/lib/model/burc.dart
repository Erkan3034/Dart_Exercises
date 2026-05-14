// bu classı burçların özelliklerini tutmak için olusturduk. Burçların adı, tarihleri, detayları gibi bilfileri içerir.

class Burc {
  final String _burcAdi;
  final String _burcTarihi;
  final String _burcDetayi;
  final String _burcKucukResim;
  final String _burcBuyukResim;
  final String _colorKey;

  Burc(
      this._burcAdi,
      this._burcTarihi,
      this._burcDetayi,
      this._burcKucukResim,
      this._burcBuyukResim,
      this._colorKey
  );

String get burcBuyukResim => this._burcBuyukResim;
String get burcKucukResim => this._burcKucukResim;
String get burcAdi => this._burcAdi;
String get burcTarihi => this._burcTarihi;
String get burcDetayi => this._burcDetayi;
String get colorKey => this._colorKey;

  @override
  String toString() {
    return "$_burcAdi - $_burcBuyukResim";
  }
}
