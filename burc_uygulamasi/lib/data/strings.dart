class Strings {
  static const String APP_NAME = "Burç Rehberi";

  // Görsel dosya adlarıyla birebir uyumlu (Türkçe karakter yok)
  static const List<String> BURC_ADLARI = [
    "KOC",
    "BOGA",
    "IKIZLER",
    "YENGEC",
    "ASLAN",
    "BASAK",
    "TERAZI",
    "AKREP",
    "YAY",
    "OGLAK",
    "KOVA",
    "BALIK"
  ];

  // Kullanıcıya gösterilecek metinler (Türkçe karakterli)
  static const List<String> BURC_ADLARI_GORUNEN = [
    "Koç",
    "Boğa",
    "İkizler",
    "Yengeç",
    "Aslan",
    "Başak",
    "Terazi",
    "Akrep",
    "Yay",
    "Oğlak",
    "Kova",
    "Balık"
  ];

  static const List<String> BURC_TARIHLERI = [
    "21 Mart - 20 Nisan",
    "21 Nisan - 21 Mayıs",
    "22 Mayıs - 22 Haziran",
    "23 Haziran - 22 Temmuz",
    "23 Temmuz - 22 Ağustos",
    "23 Ağustos - 22 Eylül",
    "23 Eylül - 22 Ekim",
    "23 Ekim - 21 Kasım",
    "22 Kasım - 21 Aralık",
    "22 Aralık - 21 Ocak",
    "22 Ocak - 19 Şubat",
    "20 Şubat - 20 Mart"
  ];

  static const List<String> BURC_GENEL_OZELLIKLERI = [
    // Koç (koc)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Mars\n"
    "Grubunuz: Ateş\n"
    "Uğurlu gününüz: Salı\n"
    "Uğurlu sayınız: 8\n"
    "Uğurlu renginiz: Ateş kırmızısı\n"
    "Uğurlu taşlarınız: Opal, Elmas, Safir\n"
    "Uğurlu çiçekleriniz: Lale, Papatya\n"
    "Uğurlu kokularınız: Manolya, Lavanta, Itır\n"
    "Olumlu özelliğiniz: Cesaret\n"
    "Olumsuz özelliğiniz: Acelecilik\n"
    "Anlaştığınız burçlar: Aslan, Yay\n"
    "Anlaşamadığınız burçlar: Yengeç, Terazi, Oğlak\n"
    "Başarılı olacağınız meslekler: Politikacılık, Yöneticilik, İşletmecilik, Mühendislik, Ressamlık, Müzisyenlik, Oyunculuk\n"
    "Burcunuzdan ünlüler: Fatih Sultan Mehmet, Sakıp Sabancı, Descartes, Charlie Chaplin, Vincent Van Gogh, Zeki Alasya",

    // Boğa (boga)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Venüs\n"
    "Grubunuz: Toprak\n"
    "Uğurlu gününüz: Cuma\n"
    "Uğurlu sayınız: 6\n"
    "Uğurlu renginiz: Pastel Mavi, Lila\n"
    "Uğurlu taşlarınız: Krizokol, Turkuaz, Safir\n"
    "Uğurlu çiçekleriniz: Kırmızı Gül, Pembe Karanfil, Şebboy\n"
    "Uğurlu kokularınız: Karanfil, Elma Çiçeği\n"
    "Olumlu özelliğiniz: Güvenilirlik\n"
    "Olumsuz özelliğiniz: İnatçılık\n"
    "Anlaştığınız burçlar: Yengeç, Balık\n"
    "Anlaşamadığınız burçlar: Kova, Aslan, Akrep\n"
    "Başarılı olacağınız meslekler: Askerlik, Doktorluk, Mimarlık, Mühendislik, Bankacılık\n"
    "Burcunuzdan ünlüler: Nükhet Duru, Öztürk Serengil, Salvador Dali, Karl Marx, Lenin, Sigmund Freud, Shakespeare",

    // İkizler (ikizler)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Merkür\n"
    "Grubunuz: Hava\n"
    "Uğurlu gününüz: Çarşamba\n"
    "Uğurlu sayınız: 5\n"
    "Uğurlu renginiz: Sarı\n"
    "Uğurlu taşlarınız: Kuvars, Akik, Turkuaz\n"
    "Uğurlu çiçekleriniz: Çiğdem, Mimoza\n"
    "Uğurlu kokularınız: Gardenya, Sümbül, Yasemin\n"
    "Olumlu özelliğiniz: Konuşkanlık\n"
    "Olumsuz özelliğiniz: Kararsızlık\n"
    "Anlaştığınız burçlar: Terazi, Kova, Aslan\n"
    "Anlaşamadığınız burçlar: Başak, Yay\n"
    "Başarılı olacağınız meslekler: Yazarlık, Bankacılık, Avukatlık, Gazetecilik, Edebiyatçılık\n"
    "Burcunuzdan ünlüler: Adile Naşit, Bülent Ecevit, John F. Kennedy, John Wayne, Schumann",

    // Yengeç (yengec)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Ay\n"
    "Grubunuz: Su\n"
    "Uğurlu gününüz: Pazartesi\n"
    "Uğurlu sayınız: 2\n"
    "Uğurlu renginiz: Beyaz\n"
    "Uğurlu taşlarınız: Ametist, Pembe Kuvars\n"
    "Uğurlu çiçekleriniz: Nilüfer, Beyaz Gül, Zambak\n"
    "Uğurlu kokularınız: Misk, Müge, Leylak\n"
    "Olumlu özelliğiniz: Sabır\n"
    "Olumsuz özelliğiniz: Dikkatsizlik\n"
    "Anlaştığınız burçlar: Boğa, Balık\n"
    "Anlaşamadığınız burçlar: Koç, Aslan, Kova\n"
    "Başarılı olacağınız meslekler: Eczacılık, Turizm, Pilotluk, Kimyagerlik\n"
    "Burcunuzdan ünlüler: Sezen Aksu, Türkan Şoray, Louis Armstrong, Tom Cruise, Giorgio Armani, Lady Diana",

    // Aslan (aslan)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Güneş\n"
    "Grubunuz: Ateş\n"
    "Uğurlu gününüz: Pazartesi\n"
    "Uğurlu sayınız: 1\n"
    "Uğurlu renginiz: Sarı\n"
    "Uğurlu taşlarınız: Sardoniks, Peridot, Krizolit\n"
    "Uğurlu çiçekleriniz: Kırmızı Gül, Sarı Krizantem, Orkide\n"
    "Uğurlu kokularınız: Misk, Portakal Çiçeği, Gül\n"
    "Olumlu özelliğiniz: Cömertlik\n"
    "Olumsuz özelliğiniz: Kendini Beğenmişlik\n"
    "Anlaştığınız burçlar: Koç, Yay\n"
    "Anlaşamadığınız burçlar: Boğa, Akrep, Kova\n"
    "Başarılı olacağınız meslekler: Askerlik, Doktorluk, Yöneticilik\n"
    "Burcunuzdan ünlüler: Uğur Mumcu, Gönül Yazar, Neil Armstrong, Benito Mussolini, Fidel Castro, Henry Ford, Madonna",

    // Başak (basak)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Merkür\n"
    "Grubunuz: Toprak\n"
    "Uğurlu gününüz: Çarşamba\n"
    "Uğurlu sayınız: 5\n"
    "Uğurlu renginiz: Kobalt Mavisi\n"
    "Uğurlu taşlarınız: Ametist, Akik, Yeşim Taşı, Zümrüt\n"
    "Uğurlu çiçekleriniz: Açelya, Sarı Menekşe, Lavanta\n"
    "Uğurlu kokularınız: Leylak, Limon, Sardunya\n"
    "Olumlu özelliğiniz: Titizlik\n"
    "Olumsuz özelliğiniz: Çekingenlik\n"
    "Anlaştığınız burçlar: Boğa, Oğlak\n"
    "Anlaşamadığınız burçlar: İkizler, Yay, Balık\n"
    "Başarılı olacağınız meslekler: Edebiyat, Yazarlık, Eczacılık, Muhasebecilik, Araştırmacılık\n"
    "Burcunuzdan ünlüler: Büyük İskender, Uğur Dündar, Sophia Loren, Michael Jackson, Vitali Hakko, Richard Gere, Sean Connery",

    // Terazi (terazi)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Venüs\n"
    "Grubunuz: Hava\n"
    "Uğurlu gününüz: Cuma\n"
    "Uğurlu sayınız: 6\n"
    "Uğurlu renginiz: Turkuaz, Mat Renkler\n"
    "Uğurlu taşlarınız: Lapis Lazuli, Mercan, Opal\n"
    "Uğurlu çiçekleriniz: Pembe Krizantem, Pembe Gül\n"
    "Uğurlu kokularınız: Gardenya, Yasemin, Orkide\n"
    "Olumlu özelliğiniz: Zarafet\n"
    "Olumsuz özelliğiniz: Gösteriş Merakı\n"
    "Anlaştığınız burçlar: İkizler, Kova\n"
    "Anlaşamadığınız burçlar: Koç, Yengeç, Oğlak\n"
    "Başarılı olacağınız meslekler: Müzisyenlik, Ressamlık, Mimarlık, Bankacılık, Politikacılık, Hukukçuluk, Heykeltraşlık\n"
    "Burcunuzdan ünlüler: Cem Özer, Hülya Avşar, Cervantes, Oscar Wilde, Pavarotti, Turgut Özal, Jimmy Carter",

    // Akrep (akrep)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Mars - Plüton\n"
    "Grubunuz: Su\n"
    "Uğurlu gününüz: Salı\n"
    "Uğurlu sayınız: 9\n"
    "Uğurlu renginiz: Kırmızı, Siyah\n"
    "Uğurlu taşlarınız: Akuamarin, Lapis Lazuli, Opal\n"
    "Uğurlu çiçekleriniz: Kırmızı Karanfil, Hanımeli, Ateş Çiçeği\n"
    "Uğurlu kokularınız: Misk, Manolya\n"
    "Olumlu özelliğiniz: Kararlılık\n"
    "Olumsuz özelliğiniz: Merhametsizlik, İhmalkarlık\n"
    "Anlaştığınız burçlar: Yengeç, Balık\n"
    "Anlaşamadığınız burçlar: Boğa, Aslan, Kova\n"
    "Başarılı olacağınız meslekler: Yöneticilik, Mühendislik, Komutanlık, Yazarlık, Müzisyenlik, Gazetecilik\n"
    "Burcunuzdan ünlüler: Süleyman Demirel, Maradona, Pablo Picasso, Prenses Diana, Indira Gandhi, Alfred Nobel",

    // Yay (yay)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Jüpiter\n"
    "Grubunuz: Ateş\n"
    "Uğurlu gününüz: Perşembe\n"
    "Uğurlu sayınız: 3\n"
    "Uğurlu renginiz: Mor, Koyu Mavi\n"
    "Uğurlu taşlarınız: Obsidyen, Krizolit, Topaz\n"
    "Uğurlu çiçekleriniz: Leylak, Mor Menekşe\n"
    "Uğurlu kokularınız: Nergis, Menekşe, Zambak\n"
    "Olumlu özelliğiniz: Girişimcilik\n"
    "Olumsuz özelliğiniz: Başkalarını Küçümseme\n"
    "Anlaştığınız burçlar: Koç, Aslan\n"
    "Anlaşamadığınız burçlar: İkizler, Başak, Balık\n"
    "Başarılı olacağınız meslekler: Politikacılık, Hukukçuluk, Araştırmacılık, Bankacılık, Öğretmenlik\n"
    "Burcunuzdan ünlüler: Mehmet Ali Birand, Zeki Müren, Walt Disney, Winston Churchill, Ludwig van Beethoven, Mark Twain",

    // Oğlak (oglak)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Satürn\n"
    "Grubunuz: Toprak\n"
    "Uğurlu gününüz: Cumartesi\n"
    "Uğurlu sayınız: 8\n"
    "Uğurlu renginiz: Koyu Kahverengi, Gri\n"
    "Uğurlu taşlarınız: Kuvars, Yakut, Kehribar\n"
    "Uğurlu çiçekleriniz: Siyah Gül, Kadife Çiçeği, Kamelya\n"
    "Uğurlu kokularınız: Kamelya, Cam, Fulya\n"
    "Olumlu özelliğiniz: Kararlılık, Sağlam Adımlar\n"
    "Olumsuz özelliğiniz: Aşırı Merak\n"
    "Anlaştığınız burçlar: Boğa, Başak\n"
    "Anlaşamadığınız burçlar: Koç, Yengeç, Terazi\n"
    "Başarılı olacağınız meslekler: Güzellik Uzmanlığı, Mimarlık, Madencilik, Doktorluk, Kuyumculuk\n"
    "Burcunuzdan ünlüler: Filiz Akın, Semra Özal, Benjamin Franklin, Elvis Presley, Isaac Newton",

    // Kova (kova)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Uranüs\n"
    "Grubunuz: Hava\n"
    "Uğurlu gününüz: Pazar\n"
    "Uğurlu sayınız: 4\n"
    "Uğurlu renginiz: Lacivert\n"
    "Uğurlu taşlarınız: Ametist, Gümüş, Granat\n"
    "Uğurlu çiçekleriniz: Zerrin, Menekşe, Kartopu, Kır Çiçekleri, Kuşburnu\n"
    "Uğurlu kokularınız: Sümbül, Yasemin, Menekşe\n"
    "Olumlu özelliğiniz: İradelilik\n"
    "Olumsuz özelliğiniz: İhmalkarlık\n"
    "Anlaştığınız burçlar: İkizler, Terazi\n"
    "Anlaşamadığınız burçlar: Boğa, Aslan, Akrep\n"
    "Başarılı olacağınız meslekler: Yazarlık, Editörlük, Gazetecilik, Sanatçılık, Organizatörlük, Muhasebecilik\n"
    "Burcunuzdan ünlüler: Ajda Pekkan, Mozart, Ronald Reagan, Schubert, Abraham Lincoln, Kim Novak",

    // Balık (balik)
    "Genel Özellikler\n"
    "Yönetici gezegeniniz: Neptün\n"
    "Grubunuz: Su\n"
    "Uğurlu gününüz: Perşembe\n"
    "Uğurlu sayınız: 7\n"
    "Uğurlu renginiz: Turkuaz, Yeşil\n"
    "Uğurlu taşlarınız: Turkuaz, Ametist, Pembe Kuvars\n"
    "Uğurlu çiçekleriniz: İnci Çiçeği, Zambak\n"
    "Uğurlu kokularınız: Kiraz Çiçeği, Zambak, Limon Çiçeği\n"
    "Olumlu özelliğiniz: Şefkat, Merhamet\n"
    "Olumsuz özelliğiniz: Kendini Küçümseme\n"
    "Anlaştığınız burçlar: Yengeç, Akrep\n"
    "Anlaşamadığınız burçlar: İkizler, Başak, Yay\n"
    "Başarılı olacağınız meslekler: Öğretmenlik, Müzisyenlik, Yazarlık, Doktorluk\n"
    "Burcunuzdan ünlüler: Beyazıt Öztürk, Hidayet Türkoğlu, Beren Saat, Yuri Gagarin, Albert Einstein, Gorbaçov"
  ];
}