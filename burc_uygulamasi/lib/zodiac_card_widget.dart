// widgets/zodiac_card.dart - This file is part of the widgets module
import 'package:flutter/material.dart';
import 'package:burc_uygulamasi/zodiac_colors_theme.dart';

class ZodiacCard extends StatefulWidget {
  final String burcAdi;
  final String burcTarihi;
  final String resim;
  final String colorKey;
  final VoidCallback onTap;

  const ZodiacCard({
    required this.burcAdi,
    required this.burcTarihi,
    required this.resim,
    required this.colorKey,
    required this.onTap,
  });

  @override
  State<ZodiacCard> createState() => _ZodiacCardState();
}

class _ZodiacCardState extends State<ZodiacCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradient = ZodiacColors.getGradient(widget.colorKey);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: gradient,
            boxShadow: [
              BoxShadow(
                color: gradient.colors[0].withOpacity(0.3),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.black26
                          : Colors.white.withOpacity(0.1),
                    ),
                    child: Image.asset(
                      widget.resim,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.black.withOpacity(0.4)
                          : Colors.white.withOpacity(0.2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.burcAdi,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          widget.burcTarihi,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
