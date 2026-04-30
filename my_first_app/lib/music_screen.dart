import 'package:flutter/material.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({super.key});

  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage>
    with SingleTickerProviderStateMixin {
  // Renk Paleti
  static const Color _primaryColor = Color(0xFF1DB954);
  static const Color _backgroundColor = Color(0xFF0F0F0F);
  static const Color _cardColor = Color(0xFF1E1E1E);
  static const Color _textColor = Color(0xFFFFFFFF);
  static const Color _secondaryTextColor = Color(0xFFB3B3B3);

  late AnimationController _animationController;
  
  bool isPlaying = false;
  bool isFavorite = false;
  double currentPosition = 35;
  double totalDuration = 240;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  String _formatTime(double seconds) {
    int minutes = (seconds / 60).floor();
    int secs = (seconds % 60).floor();
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.expand_more),
          color: _textColor,
          iconSize: 28,
          onPressed: () {
            print("Kapatıldı");
          },
        ),
        title: const Text(
          "ŞİMDİ OYNATILIYOR",
          style: TextStyle(
            color: _secondaryTextColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print("Seçenekler açılıyor...");
            },
            icon: const Icon(Icons.more_vert),
            color: _textColor,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _primaryColor.withOpacity(0.1),
              _backgroundColor,
              _backgroundColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Albüm Kapağı
                Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: _primaryColor.withOpacity(0.6),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      "https://i.pinimg.com/236x/9b/61/af/9b61afe7cf09e88325f6d356758b1e88.jpg",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: _cardColor,
                          child: const Center(
                            child: Icon(
                              Icons.music_note,
                              size: 120,
                              color: _primaryColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // Sanatçı ve Şarkı Bilgisi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gülümse",
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: _textColor,
                              letterSpacing: 0.5,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Sezen Aksu",
                            style: const TextStyle(
                              fontSize: 14,
                              color: _secondaryTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isFavorite ? _primaryColor : _secondaryTextColor,
                          width: 2,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                          print(isFavorite
                              ? "Favorilere eklendi ❤️"
                              : "Favorilerden çıkarıldı");
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? _primaryColor : _secondaryTextColor,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // İlerleme Çubuğu
                Column(
                  children: [
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 4,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 6,
                          elevation: 0,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 12,
                        ),
                        activeTrackColor: _primaryColor,
                        inactiveTrackColor: Colors.grey.shade800,
                        thumbColor: _primaryColor,
                        overlayColor: _primaryColor.withOpacity(0.3),
                      ),
                      child: Slider(
                        value: currentPosition,
                        min: 0,
                        max: totalDuration,
                        onChanged: (value) {
                          setState(() {
                            currentPosition = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatTime(currentPosition),
                            style: const TextStyle(
                              fontSize: 11,
                              color: _secondaryTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _formatTime(totalDuration),
                            style: const TextStyle(
                              fontSize: 11,
                              color: _secondaryTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                // Kontrol Düğmeleri
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Shuffle
                    IconButton(
                      onPressed: () {
                        print("Shuffle aktif");
                      },
                      icon: const Icon(Icons.shuffle),
                      iconSize: 28,
                      color: _secondaryTextColor,
                    ),

                    // Önceki
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _secondaryTextColor,
                          width: 1.5,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          print("Önceki şarkı");
                        },
                        icon: const Icon(Icons.skip_previous),
                        iconSize: 32,
                        color: _textColor,
                      ),
                    ),

                    // Oynat/Duraklat (Ana Buton)
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: _primaryColor.withOpacity(0.5),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isPlaying = !isPlaying;
                            if (isPlaying) {
                              _animationController.forward();
                            } else {
                              _animationController.reverse();
                            }
                          });
                          print(isPlaying ? "Müzik çalıyor..." : "Müzik duraklatıldı");
                        },
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: _backgroundColor,
                          size: 40,
                        ),
                      ),
                    ),

                    // Sonraki
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _secondaryTextColor,
                          width: 1.5,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          print("Sonraki şarkı");
                        },
                        icon: const Icon(Icons.skip_next),
                        iconSize: 32,
                        color: _textColor,
                      ),
                    ),

                    // Repeat
                    IconButton(
                      onPressed: () {
                        print("Repeat aktif");
                      },
                      icon: const Icon(Icons.repeat),
                      iconSize: 28,
                      color: _secondaryTextColor,
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Çalma Listesi Butonu
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _secondaryTextColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        print("Çalma listesi açılıyor...");
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.playlist_add_check,
                            color: _primaryColor,
                            size: 24,
                          ),
                          SizedBox(width: 12),
                          Text(
                            "SONRAKI ŞARKILAR",
                            style: TextStyle(
                              color: _textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}